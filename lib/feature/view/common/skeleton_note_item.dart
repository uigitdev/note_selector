import 'package:note_selector/note_selector.dart';

class SkeletonNoteItem extends StatelessWidget {
  const SkeletonNoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SkeletonItem(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SkeletonLine(
              style: SkeletonLineStyle(
                height: Dimens.skeletonNoteItemTextHeight,
                width: Dimens.skeletonNoteItemTitleWidth(context),
                borderRadius: BorderRadius.circular(
                  Dimens.skeletonNoteItemTextRadius,
                ),
              ),
            ),
            const SizedBox(height: Dimens.skeletonNoteItemTextTopPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SkeletonLine(
                    style: SkeletonLineStyle(
                      height: Dimens.skeletonNoteItemTextHeight,
                      width: Dimens.skeletonNoteItemSubtitleWidth(context),
                      borderRadius: BorderRadius.circular(
                        Dimens.skeletonNoteItemTextRadius,
                      ),
                    ),
                  ),
                ),
                SkeletonLine(
                  style: SkeletonLineStyle(
                    height: Dimens.skeletonNoteItemCheckboxHeight,
                    width: Dimens.skeletonNoteItemCheckboxHeight,
                    borderRadius: BorderRadius.circular(
                      Dimens.skeletonNoteItemCheckboxRadius,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
