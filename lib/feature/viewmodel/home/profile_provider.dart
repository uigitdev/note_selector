import 'package:note_selector/note_selector.dart';

enum ProfileErrorState { none, emptyField }

class ProfileProvider extends ChangeNotifier {
  final _repo = ProfileRepositoryImpl();
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final saveButtonStreamHolder = StreamHolder<bool>(false);
  final updateErrorStateStreamHolder = StreamHolder<ProfileErrorState>(ProfileErrorState.none);

  void updateUser(UserModel userModel) async {
    if (!saveButtonStreamHolder.data) {
      saveButtonStreamHolder.addData(true);
      if (userModel.isFillAttributes()) {
        updateErrorStateStreamHolder.addData(ProfileErrorState.none);
        final user = await _repo.updateUser(userModel).catchError((e) {
          saveButtonStreamHolder.addData(false);
          updateErrorStateStreamHolder.addError(e);
          return null;
        });
        if (user != null) {
          clearFields();
          userLocator.userStreamHolder.addData(user);
        }
        saveButtonStreamHolder.addData(false);
      } else {
        saveButtonStreamHolder.addData(false);
        updateErrorStateStreamHolder.addData(ProfileErrorState.emptyField);
      }
    }
  }

  void clearFields() {
    nameController.clear();
    usernameController.clear();
    emailController.clear();
  }

  bool areFieldsEmpty() => nameController.text.isEmpty && usernameController.text.isEmpty && emailController.text.isEmpty;
}
