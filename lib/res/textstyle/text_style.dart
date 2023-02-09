import 'package:note_selector/note_selector.dart';

class MTextStyle {
  MTextStyle._();

  static TextStyle get appBarTitle => const TextStyle(
        color: MTheme.abbBarTitle,
        fontSize: Dimens.appBarTitle,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get buttonTitle => const TextStyle(
        color: MTheme.buttonTitle,
        fontSize: Dimens.subtitle,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get smallInfo => const TextStyle(
        color: MTheme.title,
        fontSize: Dimens.info,
      );

  static TextStyle get inputErrorInfo => const TextStyle(
        color: MTheme.error,
        fontSize: Dimens.info,
        fontWeight: FontWeight.w500,
      );
}
