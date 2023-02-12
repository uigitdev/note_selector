import 'package:note_selector/note_selector.dart';

class FriendRepositoryImpl extends FriendRepository {
  @override
  Future<List<FriendModel>?> getFriends(UserModel userModel) async => await FriendListRequest(userModel).send();
}
