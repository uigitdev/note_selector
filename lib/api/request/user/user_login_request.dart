///User Auth API [path] does not exists.
///In that case it will be a dummy Auth Request with a [UserLoginModel] param.

import 'package:note_selector/note_selector.dart';

class UserLoginRequest extends HTTPRequestHolder<UserModel> {
  final UserLoginModel userLoginModel;

  UserLoginRequest(this.userLoginModel);

  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTPS;

  @override
  String get host => 'uigitdev.com';

  @override
  String get path => '/v2/user-login';

  @override
  Map<String, dynamic> get requestBody => {
        'username': userLoginModel.username,
        'password': userLoginModel.password,
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
          "username": userLoginModel.username,
          "email": '${userLoginModel.username}@${userLoginModel.username}.com',
          "name": userLoginModel.username.toUpperCase(),
        },
        dummyErrorResponse: HTTPRequestHolderDummyErrorResponse(
          isDummyErrorResponse: false,
          error: ErrorHint('auth/id-token-expired'),
        ),
      );

  @override
  JSONMapParser<UserModel> get mapParser => UserModel.fromJson;
}
