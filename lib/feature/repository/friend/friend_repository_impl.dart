import 'package:note_selector/note_selector.dart';

class FriendRepositoryImpl extends FriendRepository {
  @override
  Future<List<FriendModel>?> getFriends() async => await HTTPRequestWrapper(
        FriendListRequest(),
      ).send();

  @override
  Future<List<NoteModel>?> getFriendNote(FriendModel friendModel) async => await HTTPRequestWrapper(
        FriendNoteListRequest(friendModel),
      ).send();
}
