import 'package:note_selector/note_selector.dart';

class PaddingInputFieldErrorInfo extends StatelessWidget {
  final String title;

  const PaddingInputFieldErrorInfo({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimens.padding,
        right: Dimens.padding,
        top: Dimens.paddingTopBottomSmall,
      ),
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: MTextStyle.inputErrorInfo,
      ),
    );
  }
}
