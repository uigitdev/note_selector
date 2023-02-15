import 'package:note_selector/note_selector.dart';

class HTTPRequestWrapper<T> extends HTTPRequestHolder<T> {
  final HTTPRequestHolder<T> _request;
  final bool forTesting;

  HTTPRequestWrapper(this._request, {this.forTesting = false});

  @override
  HTTPRequestMethod get method => _request.method;

  @override
  HTTPRequestProtocol get protocol => _request.protocol;

  @override
  String get host => _request.host;

  @override
  String get path => _request.path;

  @override
  JSONParserType get parserType => _request.parserType;

  @override
  JSONMapParser<T>? get mapParser => _request.mapParser;

  @override
  JSONListParser<T>? get listParser => _request.listParser;

  @override
  Map<String, dynamic> get requestBody => _request.requestBody;

  @override
  Map<String, dynamic> get queryParams => _request.queryParams;

  @override
  Map<String, dynamic> get headers => _mergedHeaders();

  @override
  HTTPRequestHolderSettings get settings => _request.settings;

  @override
  HTTPRequestHolderDummyResponse? get dummyResponse => forTesting
      ? HTTPRequestHolderDummyResponse(
          isDummyResponse: true,
          duration: const Duration(),
          json: _request.dummyResponse != null ? _request.dummyResponse!.json : {},
        )
      : _request.dummyResponse;

  Map<String, dynamic> _mergedHeaders() {
    final headers = _request.headers;
    headers['apiKey'] = '760f94f7-edfb-4322-b532-3ec34c3216a8'; //DON'T store API key in the app!
    final user = userLocator.userStreamHolder.data;
    if (user != null) headers.addAll(user.toJson());
    return headers;
  }
}
