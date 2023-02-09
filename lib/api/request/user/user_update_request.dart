///User Update API [path] does not exists.
///In that case it will be a dummy Update Request with a [UserModel] param.

import 'package:note_selector/note_selector.dart';

class UserUpdateRequest extends HTTPRequestHolder<UserModel> {
  final UserModel userModel;

  UserUpdateRequest(this.userModel);

  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTPS;

  @override
  String get host => 'uigitdev.com';

  @override
  String get path => '/v2/user-update';

  @override
  Map<String, dynamic> get requestBody => {
        'name': userModel.name,
        'username': userModel.username,
        'email': userModel.email,
      };

  @override
  HTTPRequestMethod get method => HTTPRequestMethod.POST;

  @override
  JSONParserType get parserType => JSONParserType.MAP;

  @override
  HTTPRequestHolderDummyResponse get dummyResponse => HTTPRequestHolderDummyResponse(
        isDummyResponse: true,
        duration: const Duration(seconds: 3),
        json: {
          "username": userModel.username,
          "email": userModel.email,
          "name": userModel.name,
        },
        dummyErrorResponse: HTTPRequestHolderDummyErrorResponse(
          isDummyErrorResponse: false,
          error: ErrorHint('update/missing-token'),
        ),
      );

  @override
  JSONMapParser<UserModel> get mapParser => UserModel.fromJson;
}
