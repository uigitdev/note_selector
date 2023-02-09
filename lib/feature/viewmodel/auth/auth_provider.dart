import 'package:note_selector/note_selector.dart';

enum AuthPageState { main, login, register }

enum AuthErrorState { none, emptyField, authFailed }

class AuthProvider extends ChangeNotifier {
  final _repo = AuthRepositoryImpl();
  final authPageStateStreamHolder = StreamHolder<AuthPageState>(AuthPageState.main);
  final loginButtonStateStreamHolder = StreamHolder<bool>(false);
  final registerButtonStateStreamHolder = StreamHolder<bool>(false);
  final loginErrorStateStreamHolder = StreamHolder<AuthErrorState>(AuthErrorState.none);
  final registerErrorStateStreamHolder = StreamHolder<AuthErrorState>(AuthErrorState.none);

  void login(UserLoginModel userLoginModel) async {
    if (!loginButtonStateStreamHolder.data) {
      loginButtonStateStreamHolder.addData(true);
      if (userLoginModel.isFillAttributes()) {
        loginErrorStateStreamHolder.addData(AuthErrorState.none);
        final user = await _repo.login(userLoginModel).catchError((e) {
          loginButtonStateStreamHolder.addData(false);
          loginErrorStateStreamHolder.addData(AuthErrorState.authFailed);
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
        loginErrorStateStreamHolder.addData(AuthErrorState.emptyField);
      }
    }
  }

  void register(UserRegisterModel userRegisterModel) async {
    if (!registerButtonStateStreamHolder.data) {
      registerButtonStateStreamHolder.addData(true);
      if (userRegisterModel.isFillAttributes()) {
        registerErrorStateStreamHolder.addData(AuthErrorState.none);
        final user = await _repo.register(userRegisterModel).catchError((e) {
          registerButtonStateStreamHolder.addData(false);
          registerErrorStateStreamHolder.addData(AuthErrorState.authFailed);
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
        registerErrorStateStreamHolder.addData(AuthErrorState.emptyField);
      }
    }
  }
}
