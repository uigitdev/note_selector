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
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Consumer<NoteProvider>(
        builder: (context, provider, _) => StreamHolderBuilder<List<NoteModel>?>(
          streamHolder: provider.noteListStreamHolder,
          builder: (context, state, noteList, error) {
            switch (state) {
              case StreamHolderState.none:
                return const Center(
                  child: CircularProgressIndicator(color: MTheme.accent),
                );
              case StreamHolderState.hasError:
                return const ErrorBody();
              case StreamHolderState.hasData:
                return ListView.separated(
                  padding: const EdgeInsets.only(
                    top: Dimens.paddingListTopBottom,
                    bottom: Dimens.paddingListTopBottom,
                  ),
                  itemCount: noteList!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, position) => NoteItem(
                    noteModel: noteList[position],
                    position: position,
                  ),
                  separatorBuilder: (context, position) => const SizedBox(
                    height: Dimens.paddingListTopBottom,
                  ),
                );
            }
          },
        ),
      );
}
