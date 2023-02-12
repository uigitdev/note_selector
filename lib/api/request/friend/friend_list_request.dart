import 'package:note_selector/note_selector.dart';

class FriendListRequest extends HTTPRequestHolder<List<FriendModel>> {
  final UserModel userModel;

  FriendListRequest(this.userModel);

  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTPS;

  @override
  HTTPRequestMethod get method => HTTPRequestMethod.GET;

  @override
  String get host => 'jsonplaceholder.typicode.com';

  @override
  String get path => '/users';

  @override
  JSONParserType get parserType => JSONParserType.LIST;

  @override
  JSONListParser<List<FriendModel>> get listParser => FriendListParser.fromJson;

  @override
  HTTPRequestHolderSettings get settings => HTTPRequestHolderSettings(isDebugPrint: false);

  @override
  HTTPRequestHolderDummyResponse get dummyResponse => HTTPRequestHolderDummyResponse(
        isDummyResponse: false,
        duration: const Duration(seconds: 2),
        json: [
          {
            "id": 1,
            "name": "Leanne Graham",
            "username": "Bret",
          }
        ],
        dummyErrorResponse: HTTPRequestHolderDummyErrorResponse(
          isDummyErrorResponse: false,
          error: ErrorHint('friend/not-found'),
        ),
      );
}
