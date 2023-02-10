# note_selector

A simple Flutter app in `MVVM` architecture and with `provider`, `stream_holder` and `request_holder`.

## About the project

The application starts with an auth page where the user can login or register.<br>
Due to the fact that the auth endpoint doesn't exist I used a dummy response with `RequestHolder` package which is able to return dummy responses.<br>
<br>
After the success registration or login the user will be navigate to the home page.<br>
Where the application fetch the data from a real api with `RequestHolder` and add the value to a `StreamHolder`.<br>
<br>
Furthermore user can change its username and can logout where the `StreamHolder` detect the user changes and navigate the user to the auth page again.<br>



`Technology:` [Flutter](https://flutter.dev)<br>
`Language:` [Dart](https://dart.dev)

`Packages:`
- [StreamHolder](https://pub.dev/packages/uigitdev_stream_holder)
- [RequestHolder](https://pub.dev/packages/uigitdev_request_holder)
- [Provider](https://pub.dev/packages/provider)

`Architecture:` `MVVM`
