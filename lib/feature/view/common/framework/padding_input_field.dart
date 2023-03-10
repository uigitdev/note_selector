import 'package:note_selector/note_selector.dart';

class PaddingInputField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isSecure;
  final bool isEnabled;

  const PaddingInputField(
    this.hint,
    this.controller, {
    Key? key,
    this.isSecure = false,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: Dimens.padding,
          right: Dimens.padding,
        ),
        child: TextField(
          controller: controller,
          obscureText: isSecure,
          enableSuggestions: !isSecure,
          autocorrect: !isSecure,
          enabled: isEnabled,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      );
}
