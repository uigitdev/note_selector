import 'package:note_selector/note_selector.dart';

abstract class NoteRepository {
  Future<List<NoteModel>?> getNotes(UserModel userModel);
  Future<NoteModel?> updateNote(UserModel userModel, NoteModel noteModel);
}
