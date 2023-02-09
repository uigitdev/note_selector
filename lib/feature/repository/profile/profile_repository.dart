import 'package:note_selector/note_selector.dart';

abstract class ProfileRepository {
  Future<UserModel?> updateUser(UserModel userModel);
}
