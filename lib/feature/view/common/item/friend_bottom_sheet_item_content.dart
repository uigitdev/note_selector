import 'package:note_selector/note_selector.dart';

class FriendBottomSheetItemContent extends StatefulWidget {
  final FriendModel friendModel;

  const FriendBottomSheetItemContent({
    Key? key,
    required this.friendModel,
  }) : super(key: key);

  @override
  State<FriendBottomSheetItemContent> createState() => _FriendBottomSheetItemContentState();
}

class _FriendBottomSheetItemContentState extends State<FriendBottomSheetItemContent> {
  @override
  void initState() {
    context.read<FriendProvider>().getFriendNoteList(widget.friendModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<FriendProvider>(
        builder: (context, provider, _) => Container(
          padding: const EdgeInsets.only(
            top: Dimens.paddingTopBottomSmall,
            bottom: Dimens.paddingTopBottomSmall,
          ),
          width: double.maxFinite,
          height: Dimens.bottomSheetFriendItemHeight(context),
          child: StreamHolderBuilder<List<NoteModel>?>(
            streamHolder: provider.friendNoteListStreamHolder,
            builder: (context, state, noteList, error) {
              switch (state) {
                case StreamHolderState.none:
                  return const SkeletonList(
                    count: 10,
                    item: SkeletonNoteItem(),
                    physics: NeverScrollableScrollPhysics(),
                    separatorItem: SizedBox(height: Dimens.paddingListTopBottom),
                  );
                case StreamHolderState.hasError:
                  return const ErrorBody();
                case StreamHolderState.hasData:
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTitle(
                        title: '${widget.friendModel.username}${Textbook.friendNotes}',
                        count: noteList!.length,
                      ),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(
                            top: Dimens.paddingListTopBottom,
                            bottom: Dimens.paddingListTopBottom,
                          ),
                          itemCount: noteList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, position) => NoteItem(
                            noteModel: noteList[position],
                            position: position,
                            isJustView: true,
                          ),
                          separatorBuilder: (context, position) => const SizedBox(
                            height: Dimens.paddingListTopBottom,
                          ),
                        ),
                      ),
                    ],
                  );
              }
            },
          ),
        ),
      );
}
