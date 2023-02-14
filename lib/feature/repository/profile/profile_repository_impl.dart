import 'package:note_selector/note_selector.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  @override
  Future<UserModel?> updateUser(UserModel userModel) async => await HTTPRequestWrapper(
        UserUpdateRequest(userModel),
      ).send();
}
