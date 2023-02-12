import 'package:note_selector/note_selector.dart';

class FriendProvider extends ChangeNotifier {
  final _repo = FriendRepositoryImpl();
  final friendListStreamHolder = StreamHolder<List<FriendModel>?>(null);

  void initFriendList(UserModel userModel) async {
    final friends = await _repo.getFriends(userModel).catchError((e) {
      friendListStreamHolder.addError(e);
      return null;
    });
    if (friends != null) {
      friendListStreamHolder.addData(friends);
    }
  }
}
