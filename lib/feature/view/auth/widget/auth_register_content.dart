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
  Widget build(BuildContext context) => Consumer<AuthProvider>(
        builder: (context, provider, _) => SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PaddingInputField(Textbook.hintName, nameController),
              const SizedBox(height: Dimens.padding / 2),
              PaddingInputField(Textbook.hintUsername, usernameController),
              const SizedBox(height: Dimens.padding / 2),
              PaddingInputField(Textbook.hintEmail, emailController),
              const SizedBox(height: Dimens.padding / 2),
              PaddingInputField(Textbook.hintPassword, passwordController, isSecure: true),
              const SizedBox(height: Dimens.padding * 2),
              StreamHolderBuilder<bool>(
                streamHolder: provider.registerButtonStateStreamHolder,
                builder: (context, state, data, _) {
                  switch (state) {
                    case StreamHolderState.none:
                    case StreamHolderState.hasError:
                      return const SizedBox();
                    case StreamHolderState.hasData:
                      return PaddingButton(
                        Textbook.buttonRegister,
                        () => provider.register(
                          UserRegisterModel(
                            name: nameController.text,
                            username: usernameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        ),
                        isProgress: data!,
                      );
                  }
                },
              ),
              const SizedBox(height: Dimens.padding * 2),
              GestureDetector(
                child: Text(
                  Textbook.textButtonToLogin,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: MTextStyle.smallInfo,
                ),
                onTap: () => provider.authPageStateStreamHolder.addData(AuthPageState.login),
              ),
            ],
          ),
        ),
      );
}
