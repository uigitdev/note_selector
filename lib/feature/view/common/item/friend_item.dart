import 'package:note_selector/note_selector.dart';

class FriendItem extends StatefulWidget {
  final FriendModel friendModel;
  final int position;

  const FriendItem({
    Key? key,
    required this.friendModel,
    required this.position,
  }) : super(key: key);

  @override
  State<FriendItem> createState() => _FriendItemState();
}

class _FriendItemState extends State<FriendItem> {
  late Color randomColor;

  @override
  void initState() {
    randomColor = _randomBackgroundColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          width: Dimens.friendListItemHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: Dimens.friendListItemHeight,
                height: Dimens.friendListItemHeight,
                decoration: BoxDecoration(
                  color: randomColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(Dimens.friendListItemRadius),
                ),
                child: Center(
                  child: Text(
                    _getFirstCharFromName(widget.friendModel),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: MTextStyle.friendTextIcon(randomColor),
                  ),
                ),
              ),
              const SizedBox(height: Dimens.friendPaddingTop),
              Text(
                widget.friendModel.name,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: MTextStyle.friendTitle,
              ),
            ],
          ),
        ),
      );

  String _getFirstCharFromName(FriendModel friendModel) {
    if (friendModel.name.isNotEmpty) {
      return friendModel.name[0];
    } else {
      return 'F';
    }
  }

  Color _randomBackgroundColor() {
    final colors = <Color>[
      Colors.blue,
      Colors.pinkAccent,
      Colors.green,
      Colors.red,
      Colors.purple,
      Colors.deepOrangeAccent,
    ];
    return colors[Random().nextInt(colors.length - 1)];
  }
}
