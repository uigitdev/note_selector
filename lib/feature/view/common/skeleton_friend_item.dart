import 'package:note_selector/note_selector.dart';

class SkeletonFriendItem extends StatelessWidget {
  const SkeletonFriendItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SkeletonItem(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SkeletonAvatar(
              style: SkeletonAvatarStyle(
                shape: BoxShape.circle,
                width: Dimens.friendListItemHeight,
                height: Dimens.friendListItemHeight,
              ),
            ),
            const SizedBox(height: Dimens.skeletonFriendItemTextTopPadding),
            SkeletonLine(
              style: SkeletonLineStyle(
                height: Dimens.skeletonFriendItemTextHeight,
                width: Dimens.skeletonFriendItemTextWidth,
                borderRadius: BorderRadius.circular(
                  Dimens.skeletonFriendItemTextRadius,
                ),
              ),
            )
          ],
        ),
      );
}
