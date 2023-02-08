import 'package:note_selector/note_selector.dart';

abstract class AuthRepository{
  Future<UserModel?> login(UserLoginModel userLoginModel);
  Future<UserModel?> register(UserRegisterModel userRegisterModel);
}