import 'package:note_selector/note_selector.dart';

class HomeNotesContent extends StatefulWidget {
  const HomeNotesContent({Key? key}) : super(key: key);

  @override
  State<HomeNotesContent> createState() => _HomeNotesContentState();
}

class _HomeNotesContentState extends State<HomeNotesContent> {
  @override
  void initState() {
    context.read<NoteProvider>().initNotes();
    context.read<FriendProvider>().initFriendList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<NoteProvider>(
        builder: (context, noteProvider, _) => Consumer<FriendProvider>(
          builder: (context, friendProvider, _) => SingleChildScrollView(
            child: Column(
              children: [
                _friendList(friendProvider),
                _noteList(noteProvider),
              ],
            ),
          ),
        ),
      );

  Widget _friendList(FriendProvider provider) => StreamHolderBuilder<List<FriendModel>?>(
        streamHolder: provider.friendListStreamHolder,
        builder: (context, state, friendList, error) {
          switch (state) {
            case StreamHolderState.none:
              return const SizedBox(
                width: double.maxFinite,
                height: Dimens.friendListHeight,
                child: SkeletonList(
                  count: 10,
                  item: SkeletonFriendItem(),
                  separatorItem: SizedBox(width: Dimens.paddingLeftRightSmall),
                  scrollDirection: Axis.horizontal,
                ),
              );
            case StreamHolderState.hasError:
              return const SizedBox();
            case StreamHolderState.hasData:
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTitle(
                    title: Textbook.listTitleFriends,
                    count: friendList!.length,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: Dimens.friendListHeight,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(
                        left: Dimens.padding,
                        right: Dimens.padding,
                      ),
                      itemCount: friendList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) => FriendItem(
                        friendModel: friendList[position],
                        position: position,
                      ),
                      separatorBuilder: (context, position) => const SizedBox(
                        width: Dimens.paddingLeftRightSmall,
                      ),
                    ),
                  ),
                ],
              );
          }
        },
      );

  Widget _noteList(NoteProvider provider) => StreamHolderBuilder<List<NoteModel>?>(
        streamHolder: provider.noteListStreamHolder,
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
                    title: Textbook.listTitleNotes,
                    count: noteList!.length,
                  ),
                  ListView.separated(
                    padding: const EdgeInsets.only(
                      top: Dimens.paddingListTopBottom,
                      bottom: Dimens.paddingListTopBottom,
                    ),
                    itemCount: noteList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, position) => NoteItem(
                      noteModel: noteList[position],
                      position: position,
                    ),
                    separatorBuilder: (context, position) => const SizedBox(
                      height: Dimens.paddingListTopBottom,
                    ),
                  ),
                ],
              );
          }
        },
      );
}
