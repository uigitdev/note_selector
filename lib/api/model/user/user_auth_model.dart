import 'package:note_selector/note_selector.dart';

class UserLoginModel {
  final String username;
  final String password;

  UserLoginModel({
    required this.username,
    required this.password,
  });

  bool isFillAttributes() => username.isNotEmpty && password.isNotEmpty;
}

class UserRegisterModel extends UserModel {
  final String password;

  UserRegisterModel({
    required super.username,
    required super.name,
    required super.email,
    required this.password,
  });

  @override
  bool isFillAttributes() => username.isNotEmpty && name.isNotEmpty && email.isNotEmpty && password.isNotEmpty;
}
