import 'package:note_selector/note_selector.dart';

class NoteProvider extends ChangeNotifier {
  final _repo = NoteRepositoryImpl();
  final noteListStreamHolder = StreamHolder<List<NoteModel>?>(null);
  final noteSyncStreamHolder = StreamHolder<bool>(false);

  void initNotes() async {
    final noteList = await _repo.getNotes().catchError((e) {
      noteListStreamHolder.addError(e);
      return null;
    });
    if (noteList != null) noteListStreamHolder.addData(noteList);
  }

  void updateCompletedStatus(NoteModel noteModel, int position) {
    noteModel.changeCompletedStatus(!noteModel.completed);
    final noteList = noteListStreamHolder.data!;
    noteList[position] = noteModel;
    noteListStreamHolder.addData(noteList);
    _startUpdates(noteModel);
  }

  void _startUpdates(NoteModel noteModel) async {
    await Future.wait([_repo.updateNote(noteModel)]).then((_) async {
      noteSyncStreamHolder.addData(true);
      await Future.delayed(const Duration(seconds: 1));
      noteSyncStreamHolder.addData(false);
    }).onError((error, stackTrace) {
      noteSyncStreamHolder.addError(error!);
    });
  }
}
