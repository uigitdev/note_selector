import 'package:note_selector/note_selector.dart';

class NoteItem extends StatelessWidget {
  final NoteModel noteModel;
  final int position;
  final bool isJustView;

  const NoteItem({
    Key? key,
    required this.noteModel,
    required this.position,
    this.isJustView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(
          left: Dimens.padding,
          right: Dimens.padding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              noteModel.id.toString(),
              style: MTextStyle.noteId,
            ),
            const SizedBox(width: Dimens.paddingLeftRightSmall),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    noteModel.title,
                    style: MTextStyle.noteTitle,
                  ),
                  isJustView
                      ? const SizedBox(
                          height: Dimens.paddingTopBottomSmall,
                        )
                      : GestureDetector(
                          key: const Key('note_item_checkbox_tap'),
                          onTap: () => context.read<NoteProvider>().updateCompletedStatus(noteModel, position),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  Textbook.completed,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: MTextStyle.noteCompleted,
                                ),
                              ),
                              AbsorbPointer(
                                child: Checkbox(
                                  key: const Key('note_item_checkbox'),
                                  value: noteModel.completed,
                                  onChanged: (_) {},
                                ),
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(height: Dimens.paddingTopBottomSmall),
                  Container(
                    width: double.maxFinite,
                    height: 1,
                    color: MTheme.divider,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
