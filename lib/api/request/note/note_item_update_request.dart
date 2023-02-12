import 'package:note_selector/note_selector.dart';

class NoteItemUpdateRequest extends HTTPRequestHolder<NoteModel> {
  final UserModel userModel;
  final NoteModel noteModel;

  NoteItemUpdateRequest(this.userModel, this.noteModel);

  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTPS;

  @override
  HTTPRequestMethod get method => HTTPRequestMethod.POST;

  @override
  String get host => 'uigitdev.com';

  @override
  String get path => '/v2/note-update';

  @override
  Map<String, dynamic> get requestBody => {
        'userId': noteModel.userId,
        'id': noteModel.id,
        'title': noteModel.title,
        'completed': noteModel.completed,
      };

  @override
  JSONParserType get parserType => JSONParserType.MAP;

  @override
  JSONMapParser<NoteModel> get mapParser => NoteModel.fromJson;

  @override
  HTTPRequestHolderDummyResponse get dummyResponse => HTTPRequestHolderDummyResponse(
        isDummyResponse: true,
        duration: const Duration(seconds: 3),
        json: {
          "userId": noteModel.userId,
          "id": noteModel.id,
          "title": noteModel.title,
          "completed": noteModel.completed,
        },
        dummyErrorResponse: HTTPRequestHolderDummyErrorResponse(
          isDummyErrorResponse: false,
          error: ErrorHint('note/note-not-found'),
        ),
      );
}
