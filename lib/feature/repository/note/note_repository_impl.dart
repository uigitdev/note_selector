import 'package:note_selector/note_selector.dart';

class NoteRepositoryImpl extends NoteRepository {
  @override
  Future<List<NoteModel>?> getNotes() async => await NoteListRequest().send();

  @override
  Future<NoteModel?> updateNote(NoteModel noteModel) async => await NoteItemUpdateRequest(noteModel).send();
}
