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
        builder: (context, provider, _) => StreamHolderBuilder<bool>(
          streamHolder: provider.loginButtonStateStreamHolder,
          builder: (context, state, isInProgress, _) {
            switch (state) {
              case StreamHolderState.none:
              case StreamHolderState.hasError:
                return const ErrorBody();
              case StreamHolderState.hasData:
                return SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PaddingInputField(Textbook.hintUsername, usernameController, isEnabled: !isInProgress!),
                      const SizedBox(height: Dimens.paddingTopBottomSmall),
                      PaddingInputField(Textbook.hintPassword, passwordController, isSecure: true, isEnabled: !isInProgress),
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
                      const SizedBox(height: Dimens.paddingTopBottomBig),
                      PaddingButton(
                        Textbook.buttonLogin,
                        () => provider.login(
                          UserLoginModel(
                            username: usernameController.text,
                            password: passwordController.text,
                          ),
                        ),
                        isProgress: isInProgress,
                      ),
                      const SizedBox(height: Dimens.paddingTopBottomBig),
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
                );
            }
          },
        ),
      );
}
