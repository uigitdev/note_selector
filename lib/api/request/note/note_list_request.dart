import 'package:note_selector/note_selector.dart';

class NoteListRequest extends HTTPRequestHolder<List<NoteModel>> {
  final UserModel userModel;

  NoteListRequest(this.userModel);

  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTPS;

  @override
  HTTPRequestMethod get method => HTTPRequestMethod.GET;

  @override
  String get host => 'jsonplaceholder.typicode.com';

  @override
  String get path => '/todos';

  @override
  JSONParserType get parserType => JSONParserType.LIST;

  @override
  JSONListParser<List<NoteModel>> get listParser => NoteListParser.fromJson;

  @override
  HTTPRequestHolderSettings get settings => HTTPRequestHolderSettings(isDebugPrint: false);

  @override
  HTTPRequestHolderDummyResponse get dummyResponse => HTTPRequestHolderDummyResponse(
        isDummyResponse: false,
        duration: const Duration(seconds: 2),
        json: [
          {
            "userId": 0,
            "id": 0,
            "title": "Test note",
            "completed": false,
          }
        ],
        dummyErrorResponse: HTTPRequestHolderDummyErrorResponse(
          isDummyErrorResponse: false,
          error: ErrorHint('note/user-id-not-found'),
        ),
      );
}
