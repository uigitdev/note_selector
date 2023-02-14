import 'package:note_selector/note_selector.dart';

abstract class FriendRepository {
  Future<List<FriendModel>?> getFriends();
}
