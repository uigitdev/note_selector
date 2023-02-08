import 'package:note_selector/note_selector.dart';

class AuthMainContent extends StatelessWidget {
  const AuthMainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<AuthProvider>(
        builder: (context, provider, _) => SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PaddingButton(
                Textbook.buttonLogin,
                () => provider.authPageStateStreamHolder.addData(AuthPageState.login),
              ),
              const SizedBox(height: Dimens.padding / 2),
              PaddingButton(
                Textbook.buttonRegister,
                () => provider.authPageStateStreamHolder.addData(AuthPageState.register),
              ),
            ],
          ),
        ),
      );
}
