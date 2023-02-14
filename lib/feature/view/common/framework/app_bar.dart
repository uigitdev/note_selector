import 'package:note_selector/note_selector.dart';

class MAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size(double.maxFinite, Dimens.appBarHeight);

  const MAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: MTheme.accent,
        elevation: 2,
        title: Text(
          title,
          style: MTextStyle.appBarTitle,
        ),
      );
}
