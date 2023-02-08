///User Auth API [path] does not exists.
///In that case it will be a dummy Auth Request with a [UserRegisterModel] param.

import 'package:note_selector/note_selector.dart';

class UserRegisterRequest extends HTTPRequestHolder<UserModel> {
  final UserRegisterModel userRegisterModel;

  UserRegisterRequest(this.userRegisterModel);

  @override
  HTTPRequestProtocol get protocol => HTTPRequestProtocol.HTTPS;

  @override
  String get host => 'uigitdev.com';

  @override
  String get path => '/v2/user-register';

  @override
  Map<String, dynamic> get requestBody => {
        'name': userRegisterModel.name,
        'username': userRegisterModel.username,
        'email': userRegisterModel.email,
        'password': userRegisterModel.password,
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
          "username": userRegisterModel.username,
          "email": userRegisterModel.email,
          "name": userRegisterModel.name,
        },
      );

  @override
  JSONMapParser<UserModel> get mapParser => UserModel.fromJson;
}
