import 'package:flutter/cupertino.dart';

class Dimens {
  Dimens._();

  static const double title = 20;
  static const double subtitle = 17;
  static const double info = 14;

  static const double padding = 20;
  static const double paddingTopBottomSmall = padding / 2;
  static const double paddingTopBottomBig = padding * 2;
  static const double paddingLeftRightSmall = padding / 1.5;

  static const double paddingListTopBottom = 20;

  static const double appBarTitle = 18;
  static const double appBarHeight = 56;

  static const double buttonHeight = 50;
  static const double buttonProgressHeight = buttonHeight / 2.5;
  static const double buttonRadius = 4;

  static const double friendListHeight = friendListItemHeight + friendPaddingTop + (padding * 3);
  static const double friendListItemHeight = 80;
  static const double friendListItemRadius = friendListItemHeight / 2;
  static const double friendPaddingTop = 5;

  static const double skeletonFriendItemTextWidth = friendListItemHeight / 1.2;
  static const double skeletonFriendItemTextHeight = 15;
  static const double skeletonFriendItemTextRadius = skeletonFriendItemTextHeight / 2;
  static const double skeletonFriendItemTextTopPadding = 10;

  static double skeletonNoteItemTitleWidth(BuildContext context) => MediaQuery.of(context).size.width * 0.7;
  static double skeletonNoteItemSubtitleWidth(BuildContext context) => MediaQuery.of(context).size.width * 0.4;
  static const double skeletonNoteItemTextTopPadding = 10;
  static const double skeletonNoteItemCheckboxHeight = 20;
  static const double skeletonNoteItemTextHeight = 15;
  static const double skeletonNoteItemTextRadius = skeletonNoteItemTextHeight / 2;
  static const double skeletonNoteItemCheckboxRadius = skeletonNoteItemCheckboxHeight * 0.3;

  static const double bottomSheetRadius = 8;
  static double bottomSheetFriendItemHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.6;
}
