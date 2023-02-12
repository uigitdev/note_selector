import 'package:note_selector/note_selector.dart';

class NoteRepositoryImpl extends NoteRepository {
  @override
  Future<List<NoteModel>?> getNotes(UserModel userModel) async => await NoteListRequest(userModel).send();

  @override
  Future<NoteModel?> updateNote(UserModel userModel, NoteModel noteModel) async => await NoteItemUpdateRequest(userModel, noteModel).send();
}
