import 'package:note_selector/note_selector.dart';

class FriendProvider extends ChangeNotifier {
  final _repo = FriendRepositoryImpl();

  ///[friendListStreamHolder] is NOT available in [FriendBottomSheetItemContent]
  final friendListStreamHolder = StreamHolder<List<FriendModel>?>(null);

  ///[friendNoteListStreamHolder] is available JUST IN [FriendBottomSheetItemContent]
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
