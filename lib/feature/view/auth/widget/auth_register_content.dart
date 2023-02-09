import 'package:note_selector/note_selector.dart';

class AuthRegisterContent extends StatefulWidget {
  const AuthRegisterContent({Key? key}) : super(key: key);

  @override
  State<AuthRegisterContent> createState() => _AuthRegisterContentState();
}

class _AuthRegisterContentState extends State<AuthRegisterContent> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<AuthProvider>(
        builder: (context, provider, _) => StreamHolderBuilder<bool>(
          streamHolder: provider.registerButtonStateStreamHolder,
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
                      PaddingInputField(Textbook.hintName, nameController, isEnabled: !isInProgress!),
                      const SizedBox(height: Dimens.paddingTopBottomSmall),
                      PaddingInputField(Textbook.hintUsername, usernameController, isEnabled: !isInProgress),
                      const SizedBox(height: Dimens.paddingTopBottomSmall),
                      PaddingInputField(Textbook.hintEmail, emailController, isEnabled: !isInProgress),
                      const SizedBox(height: Dimens.paddingTopBottomSmall),
                      PaddingInputField(Textbook.hintPassword, passwordController, isSecure: true, isEnabled: !isInProgress),
                      StreamHolderBuilder<AuthErrorState>(
                        streamHolder: provider.registerErrorStateStreamHolder,
                        builder: (context, state, data, error) {
                          switch (state) {
                            case StreamHolderState.none:
                              return const SizedBox();
                            case StreamHolderState.hasError:
                              return PaddingInputFieldErrorInfo(title: error.toString());
                            case StreamHolderState.hasData:
                              switch (data!) {
                                case AuthErrorState.none:
                                  return const SizedBox();
                                case AuthErrorState.emptyField:
                                  return const PaddingInputFieldErrorInfo(title: Textbook.errorAuthEmpty);
                              }
                          }
                        },
                      ),
                      const SizedBox(height: Dimens.paddingTopBottomBig),
                      PaddingButton(
                        Textbook.buttonRegister,
                        () => provider.register(
                          UserRegisterModel(
                            name: nameController.text,
                            username: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        ),
                        isProgress: isInProgress,
                      ),
                      const SizedBox(height: Dimens.paddingTopBottomBig),
                      Center(
                        child: GestureDetector(
                          child: Text(
                            Textbook.textButtonToLogin,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: MTextStyle.smallInfo,
                          ),
                          onTap: () => provider.addPageState(AuthPageState.login),
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
