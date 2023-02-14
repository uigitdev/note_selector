import 'package:note_selector/note_selector.dart';

class PaddingButton extends StatelessWidget {
  final String title;
  final VoidCallback function;
  final bool isProgress;

  const PaddingButton(
    this.title,
    this.function, {
    Key? key,
    this.isProgress = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: Dimens.padding,
          right: Dimens.padding,
        ),
        child: MButton(
          title: title,
          function: function,
          isProgress: isProgress,
        ),
      );
}
