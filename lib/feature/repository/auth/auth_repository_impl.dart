import 'package:note_selector/note_selector.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<UserModel?> login(UserLoginModel userLoginModel) async => await UserLoginRequest(userLoginModel).send();

  @override
  Future<UserModel?> register(UserRegisterModel userRegisterModel) async => await UserRegisterRequest(userRegisterModel).send();
}
