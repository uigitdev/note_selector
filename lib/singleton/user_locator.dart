import 'package:note_selector/note_selector.dart';

class UserLocator {
  static final _instance = UserLocator._internal();

  UserLocator._internal();

  factory UserLocator() => _instance;

  final userStreamHolder = StreamHolder<UserModel?>(null);

  void observeUser() {
    userStreamHolder.stream.listen((user) => user == null ? routerLocator.closeAll(RouterName.auth) : null);
  }
}
