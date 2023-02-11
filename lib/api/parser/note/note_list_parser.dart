import 'package:note_selector/note_selector.dart';

class NoteListParser {
  NoteListParser._();

  static List<NoteModel> fromJson(List<dynamic> jsonList) => jsonList.map<NoteModel>((jsonItem) => NoteModel.fromJson(jsonItem)).toList();
}
