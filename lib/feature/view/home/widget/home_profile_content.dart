import 'package:note_selector/note_selector.dart';

class HomeProfileContent extends StatefulWidget {
  const HomeProfileContent({Key? key}) : super(key: key);

  @override
  State<HomeProfileContent> createState() => _HomeProfileContentState();
}

class _HomeProfileContentState extends State<HomeProfileContent> {
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Consumer<ProfileProvider>(
        builder: (context, provider, _) => StreamHolderBuilder<UserModel?>(
          streamHolder: userLocator.userStreamHolder,
          builder: (context, state, data, error) {
            switch (state) {
              case StreamHolderState.none:
              case StreamHolderState.hasError:
                return const ErrorBody();
              case StreamHolderState.hasData:
                _initControllers(data!);
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: Dimens.paddingTopBottomBig,
                    bottom: Dimens.paddingTopBottomBig,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PaddingInputField(Textbook.hintName, nameController, isEnabled: true),
                      const SizedBox(height: Dimens.paddingTopBottomSmall),
                      PaddingInputField(Textbook.hintUsername, usernameController, isEnabled: true),
                      const SizedBox(height: Dimens.paddingTopBottomSmall),
                      PaddingInputField(Textbook.hintEmail, emailController, isEnabled: true),
                      const SizedBox(height: Dimens.paddingTopBottomBig),
                      PaddingButton(Textbook.buttonSave, isProgress: false, () {}),
                      const SizedBox(height: Dimens.paddingTopBottomSmall),
                      PaddingButton(Textbook.buttonLogout, () {}),
                      const SizedBox(height: Dimens.paddingTopBottomSmall),
                    ],
                  ),
                );
            }
          },
        ),
      );

  void _initControllers(UserModel user) {
    nameController.text = user.name;
    usernameController.text = user.username;
    emailController.text = user.email;
  }
}
