import 'package:note_selector/note_selector.dart';

class FriendListParser {
  FriendListParser._();

  static List<FriendModel> fromJson(List<dynamic> jsonList) => jsonList.map<FriendModel>((jsonItem) => FriendModel.fromJson(jsonItem)).toList();
}
