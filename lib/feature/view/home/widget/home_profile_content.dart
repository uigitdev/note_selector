import 'package:note_selector/note_selector.dart';

class HomeProfileContent extends StatefulWidget {
  const HomeProfileContent({Key? key}) : super(key: key);

  @override
  State<HomeProfileContent> createState() => _HomeProfileContentState();
}

class _HomeProfileContentState extends State<HomeProfileContent> {
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
                return StreamHolderBuilder<bool>(
                  streamHolder: provider.saveButtonStreamHolder,
                  builder: (context, state, isInProgress, _) {
                    switch (state) {
                      case StreamHolderState.none:
                      case StreamHolderState.hasError:
                        return const ErrorBody();
                      case StreamHolderState.hasData:
                        _initControllers(data!, isInProgress!);
                        return SingleChildScrollView(
                          padding: const EdgeInsets.only(
                            top: Dimens.paddingTopBottomBig,
                            bottom: Dimens.paddingTopBottomBig,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              PaddingInputField(Textbook.hintName, provider.nameController, isEnabled: !isInProgress),
                              const SizedBox(height: Dimens.paddingTopBottomSmall),
                              PaddingInputField(Textbook.hintUsername, provider.usernameController, isEnabled: !isInProgress),
                              const SizedBox(height: Dimens.paddingTopBottomSmall),
                              PaddingInputField(Textbook.hintEmail, provider.emailController, isEnabled: !isInProgress),
                              const SizedBox(height: Dimens.paddingTopBottomBig),
                              PaddingButton(Textbook.buttonSave, isProgress: isInProgress, () {}),
                              const SizedBox(height: Dimens.paddingTopBottomSmall),
                              PaddingButton(Textbook.buttonLogout, () => !isInProgress ? userLocator.logout() : null),
                              const SizedBox(height: Dimens.paddingTopBottomSmall),
                            ],
                          ),
                        );
                    }
                  },
                );
            }
          },
        ),
      );

  void _initControllers(UserModel user, bool isInProgress) {
    if (!isInProgress) {
      final provider = context.read<ProfileProvider>();
      provider.nameController.text = user.name;
      provider.usernameController.text = user.username;
      provider.emailController.text = user.email;
    }
  }
}
