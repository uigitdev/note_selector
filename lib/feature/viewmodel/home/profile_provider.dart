import 'package:note_selector/note_selector.dart';

class ProfileProvider extends ChangeNotifier{
  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final saveButtonStreamHolder = StreamHolder<bool>(false);
}