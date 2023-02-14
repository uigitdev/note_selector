import 'package:note_selector/note_selector.dart';

class BottomSheetFrame {
  BottomSheetFrame._();

  static void show(BuildContext context, {required Widget content}) => showModalBottomSheet(
        elevation: 0,
        backgroundColor: MTheme.bottomSheetBackground,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimens.bottomSheetRadius),
            topRight: Radius.circular(Dimens.bottomSheetRadius),
          ),
        ),
        builder: (context) => content,
      );
}
