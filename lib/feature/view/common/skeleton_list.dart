import 'package:note_selector/note_selector.dart';

class SkeletonList extends StatelessWidget {
  final int count;
  final Axis scrollDirection;
  final Widget item;
  final Widget separatorItem;
  final ScrollPhysics? physics;

  const SkeletonList({
    Key? key,
    required this.count,
    required this.item,
    required this.separatorItem,
    this.scrollDirection = Axis.vertical,
    this.physics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.separated(
        shrinkWrap: true,
        itemCount: count,
        physics: physics,
        scrollDirection: scrollDirection,
        padding: const EdgeInsets.all(Dimens.padding),
        itemBuilder: (context, position) => item,
        separatorBuilder: (context, position) => separatorItem,
      );
}
