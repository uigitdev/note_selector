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
  });
}
