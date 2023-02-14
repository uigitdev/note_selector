import 'package:note_selector/note_selector.dart';

class FriendRepositoryImpl extends FriendRepository {
  @override
  Future<List<FriendModel>?> getFriends() async => await HTTPRequestWrapper(
        FriendListRequest(),
      ).send();
}
