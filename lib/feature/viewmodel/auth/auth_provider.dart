import 'package:note_selector/note_selector.dart';

enum AuthPageState { main, login, register }

class AuthProvider extends ChangeNotifier {
  final _repo = AuthRepositoryImpl();
  final authPageStateStreamHolder = StreamHolder<AuthPageState>(AuthPageState.main);
  final loginButtonStateStreamHolder = StreamHolder<bool>(false);
  final registerButtonStateStreamHolder = StreamHolder<bool>(false);

  void login(UserLoginModel userLoginModel) async {
    if (!loginButtonStateStreamHolder.data) {
      loginButtonStateStreamHolder.addData(true);
      if (userLoginModel.isFillAttributes()) {
        final user = await _repo.login(userLoginModel).catchError((e) {
          loginButtonStateStreamHolder.addData(false);
          return null;
        });
        if (user != null) {
          userLocator.userStreamHolder.addData(user);
          routerLocator.closePage();
          routerLocator.openPageByName(RouterName.home);
        }
        loginButtonStateStreamHolder.addData(false);
      } else {
        loginButtonStateStreamHolder.addData(false);
      }
    }
  }

  void register(UserRegisterModel userRegisterModel) async {
    if (!registerButtonStateStreamHolder.data) {
      registerButtonStateStreamHolder.addData(true);
      if (userRegisterModel.isFillAttributes()) {
        final user = await _repo.register(userRegisterModel).catchError((e) {
          registerButtonStateStreamHolder.addData(false);
          return null;
        });
        if (user != null) {
          userLocator.userStreamHolder.addData(user);
          routerLocator.closePage();
          routerLocator.openPageByName(RouterName.home);
        }
        registerButtonStateStreamHolder.addData(false);
      } else {
        registerButtonStateStreamHolder.addData(false);
      }
    }
  }
}
