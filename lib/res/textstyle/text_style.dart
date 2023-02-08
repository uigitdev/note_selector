import 'package:note_selector/note_selector.dart';

class MTextStyle {
  MTextStyle._();

  static TextStyle get appBarTitle => const TextStyle(
        color: MTheme.abbBarTitle,
        fontSize: Dimens.appBarTitle,
        fontWeight: FontWeight.w500,
      );
}
