import 'package:note_selector/note_selector.dart';

class ListTitle extends StatelessWidget {
  final String title;
  final int count;

  const ListTitle({
    Key? key,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: Dimens.padding,
          right: Dimens.padding,
          top: Dimens.paddingTopBottomSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              '$title ($count)',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MTextStyle.listTitle,
            ),
            const SizedBox(height: Dimens.paddingTopBottomSmall),
            Container(
              width: double.maxFinite,
              height: 1,
              color: MTheme.divider,
            ),
          ],
        ),
      );
}
