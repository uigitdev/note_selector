import 'package:note_selector/note_selector.dart';

class NoteProvider extends ChangeNotifier {
  final _repo = NoteRepositoryImpl();
  final noteListStreamHolder = StreamHolder<List<NoteModel>?>(null);
  final noteSyncStreamHolder = StreamHolder<bool>(false);

  void initNotes(UserModel userModel) async {
    final noteList = await _repo.getNotes(userModel).catchError((e) {
      noteListStreamHolder.addError(e);
      return null;
    });
    if (noteList != null) noteListStreamHolder.addData(noteList);
  }

  void updateCompletedStatus(UserModel userModel, NoteModel noteModel, int position) {
    noteModel.changeCompletedStatus(!noteModel.completed);
    final noteList = noteListStreamHolder.data!;
    noteList[position] = noteModel;
    noteListStreamHolder.addData(noteList);
    _startUpdates(userModel, noteModel);
  }

  void _startUpdates(UserModel userModel, NoteModel noteModel) async {
    await Future.wait([_repo.updateNote(userModel, noteModel)]).then((_) async {
      noteSyncStreamHolder.addData(true);
      await Future.delayed(const Duration(seconds: 1));
      noteSyncStreamHolder.addData(false);
    }).onError((error, stackTrace) {
      noteSyncStreamHolder.addError(error!);
    });
  }
}
