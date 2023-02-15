import 'package:note_selector/note_selector.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the dummyResponse method of the HTTPRequestWrapper', () {
    final userLoginModel = UserLoginModel(username: '', password: '');
    final request = UserLoginRequest(userLoginModel);
    final requestWrapper = HTTPRequestWrapper(request, forTesting: true);

    test(
      'Object type testing',
      () => expect(requestWrapper.dummyResponse.runtimeType, HTTPRequestHolderDummyResponse),
    );

    test(
      'Zero time duration testing',
      () => expect(requestWrapper.dummyResponse!.duration, const Duration()),
    );

    test(
      'Activate status testing',
      () => expect(requestWrapper.dummyResponse!.isDummyResponse, true),
    );

    test(
      'JSON response type testing',
      () => expect(requestWrapper.dummyResponse!.json is Map<String, dynamic>, true),
    );

    test(
      'apiKey is in the header testing',
      () => expect(requestWrapper.headers['apiKey'].isNotEmpty, true, reason: 'Must not to be empty'),
    );

    test('currentUser is in the header testing', () async {
      final currentUser = UserModel(
        username: 'my_username',
        name: 'My Name',
        email: 'myname@email.com',
      );

      userLocator.userStreamHolder.addData(currentUser);
      expect(requestWrapper.headers['currentUser'] != null, true);
    });
  });

  group('Testing the parser of the auth and user requests', () {
    test('Testing the login request', () async {
      final userLoginModel = UserLoginModel(
        username: 'my_username',
        password: 'my_password',
      );
      final request = UserLoginRequest(userLoginModel);
      final requestWrapper = HTTPRequestWrapper(request, forTesting: true);

      expect((requestWrapper.dummyResponse!.json as Map).isNotEmpty, true);

      final response = await requestWrapper.send();

      expect(response!.username, userLoginModel.username, reason: 'Must to be "${userLoginModel.username}"');
      expect(response.name.isNotEmpty, true, reason: 'Must not to be empty');
      expect(response.email.isNotEmpty, true, reason: 'Must not to be empty');
    });

    test('Testing the register request', () async {
      final userRegisterModel = UserRegisterModel(
        username: 'my_username',
        name: 'My Name',
        email: 'myname@email.com',
        password: 'my_password',
      );
      final request = UserRegisterRequest(userRegisterModel);
      final requestWrapper = HTTPRequestWrapper(request, forTesting: true);

      expect((requestWrapper.dummyResponse!.json as Map).isNotEmpty, true);

      final response = await requestWrapper.send();

      expect(response!.username.isNotEmpty, true, reason: 'Must not to be empty');
      expect(response.name.isNotEmpty, true, reason: 'Must not to be empty');
      expect(response.email.isNotEmpty, true, reason: 'Must not to be empty');
    });

    test('Testing the user update request', () async {
      final newUserModel = UserModel(
        username: 'my_new_username',
        name: 'My New Name',
        email: 'mynewname@email.com',
      );

      final request = UserUpdateRequest(newUserModel);
      final requestWrapper = HTTPRequestWrapper(request, forTesting: true);

      expect((requestWrapper.dummyResponse!.json as Map).isNotEmpty, true);

      final response = await requestWrapper.send();

      expect(response!.username, newUserModel.username, reason: 'Must to be "${newUserModel.username}"');
      expect(response.name, newUserModel.name, reason: 'Must to be "${newUserModel.name}"');
      expect(response.email, newUserModel.email, reason: 'Must to be "${newUserModel.email}"');
    });
  });
}
