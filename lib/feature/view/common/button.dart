import 'package:note_selector/note_selector.dart';

class MButton extends StatelessWidget {
  final String title;
  final VoidCallback function;
  final bool isProgress;

  const MButton({
    Key? key,
    required this.title,
    required this.function,
    this.isProgress = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Material(
        color: MTheme.accent,
        borderRadius: BorderRadius.circular(Dimens.buttonRadius),
        child: InkWell(
          onTap: function,
          child: Container(
            width: double.maxFinite,
            height: Dimens.buttonHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.buttonRadius),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: MTextStyle.buttonTitle,
                  ),
                ),
                const SizedBox(width: Dimens.padding / 1.5),
                isProgress
                    ? const SizedBox(
                        width: Dimens.buttonHeight / 2.5,
                        height: Dimens.buttonHeight / 2.5,
                        child: CircularProgressIndicator(
                          color: MTheme.buttonTitle,
                          strokeWidth: 3,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      );
}
