import 'package:note_selector/note_selector.dart';

class FriendProvider extends ChangeNotifier {
  final _repo = FriendRepositoryImpl();
  final friendListStreamHolder = StreamHolder<List<FriendModel>?>(null);
  final friendNoteListStreamHolder = StreamHolder<List<NoteModel>?>(null);

  void initFriendList() async {
    final friends = await _repo.getFriends().catchError((e) {
      friendListStreamHolder.addError(e);
      return null;
    });
    if (friends != null) friendListStreamHolder.addData(friends);
  }

  void getFriendNoteList(FriendModel friendModel) async {
    final noteList = await _repo.getFriendNote(friendModel).catchError((e) {
      friendNoteListStreamHolder.addError(e);
      return null;
    });
    if (noteList != null) friendNoteListStreamHolder.addData(noteList);
  }
}
