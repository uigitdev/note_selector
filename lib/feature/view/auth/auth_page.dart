import 'package:note_selector/note_selector.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: Providers.providersByAccess(ProviderAccess.auth),
        child: Consumer<AuthProvider>(
          builder: (context, provider, _) => StreamHolderBuilder(
            streamHolder: provider.authPageStateStreamHolder,
            builder: (context, state, data, _) {
              switch (state) {
                case StreamHolderState.none:
                case StreamHolderState.hasError:
                  return const UnknownPage();
                case StreamHolderState.hasData:
                  return Scaffold(
                    appBar: MAppBar(title: _authPageContentTitle(data!)),
                    body: _authPageContentLoader(data),
                  );
              }
            },
          ),
        ),
      );

  String _authPageContentTitle(AuthPageState content) {
    switch (content) {
      case AuthPageState.main:
        return Textbook.authContentTitleMain;
      case AuthPageState.login:
        return Textbook.authContentTitleLogin;
      case AuthPageState.register:
        return Textbook.authContentTitleRegister;
    }
  }

  Widget _authPageContentLoader(AuthPageState content) {
    switch (content) {
      case AuthPageState.main:
        return const AuthMainContent();
      case AuthPageState.login:
        return const AuthLoginContent();
      case AuthPageState.register:
        return const AuthRegisterContent();
    }
  }
}
