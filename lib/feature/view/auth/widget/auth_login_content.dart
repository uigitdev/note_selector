import 'package:note_selector/note_selector.dart';

class AuthLoginContent extends StatefulWidget {
  const AuthLoginContent({Key? key}) : super(key: key);

  @override
  State<AuthLoginContent> createState() => _AuthLoginContentState();
}

class _AuthLoginContentState extends State<AuthLoginContent> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Consumer<AuthProvider>(
        builder: (context, provider, _) => SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PaddingInputField(Textbook.hintUsername, usernameController),
              const SizedBox(height: Dimens.padding / 2),
              PaddingInputField(Textbook.hintPassword, passwordController, isSecure: true),
              StreamHolderBuilder<AuthErrorState>(
                streamHolder: provider.loginErrorStateStreamHolder,
                builder: (context, state, data, _) {
                  switch (state) {
                    case StreamHolderState.none:
                    case StreamHolderState.hasError:
                      return const SizedBox();
                    case StreamHolderState.hasData:
                      switch (data!) {
                        case AuthErrorState.none:
                          return const SizedBox();
                        case AuthErrorState.emptyField:
                          return const PaddingInputFieldErrorInfo(title: Textbook.errorAuthEmpty);
                        case AuthErrorState.authFailed:
                          return const PaddingInputFieldErrorInfo(title: Textbook.errorAuthFailed);
                      }
                  }
                },
              ),
              const SizedBox(height: Dimens.padding * 2),
              StreamHolderBuilder<bool>(
                streamHolder: provider.loginButtonStateStreamHolder,
                builder: (context, state, data, _) {
                  switch (state) {
                    case StreamHolderState.none:
                    case StreamHolderState.hasError:
                      return const SizedBox();
                    case StreamHolderState.hasData:
                      return PaddingButton(
                        Textbook.buttonLogin,
                        () => provider.login(
                          UserLoginModel(
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                        ),
                        isProgress: data!,
                      );
                  }
                },
              ),
              const SizedBox(height: Dimens.padding * 2),
              Center(
                child: GestureDetector(
                  child: Text(
                    Textbook.textButtonToRegister,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: MTextStyle.smallInfo,
                  ),
                  onTap: () => provider.addPageState(AuthPageState.register),
                ),
              ),
            ],
          ),
        ),
      );
}
