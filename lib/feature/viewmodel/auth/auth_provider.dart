import 'package:note_selector/note_selector.dart';

enum AuthPageState { main, login, register }

enum AuthErrorState { none, emptyField }

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
          loginErrorStateStreamHolder.addError(e);
          return null;
        });
        if (user != null) {
          userLocator.userStreamHolder.addData(user);
          routeLocator.closePage();
          routeLocator.openPageByRouteName(RouteName.home);
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
          registerErrorStateStreamHolder.addError(e);
          return null;
        });
        if (user != null) {
          userLocator.userStreamHolder.addData(user);
          routeLocator.closePage();
          routeLocator.openPageByRouteName(RouteName.home);
        }
        registerButtonStateStreamHolder.addData(false);
      } else {
        registerButtonStateStreamHolder.addData(false);
        registerErrorStateStreamHolder.addData(AuthErrorState.emptyField);
      }
    }
  }

  void addPageState(AuthPageState pageState){
    if(!loginButtonStateStreamHolder.data && !registerButtonStateStreamHolder.data){
      authPageStateStreamHolder.addData(pageState);
      loginErrorStateStreamHolder.addData(AuthErrorState.none);
      registerErrorStateStreamHolder.addData(AuthErrorState.none);
    }
  }
}
