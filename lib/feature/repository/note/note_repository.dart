import 'package:note_selector/note_selector.dart';

abstract class NoteRepository {
  Future<List<NoteModel>?> getNotes();
  Future<NoteModel?> updateNote(NoteModel noteModel);
}
