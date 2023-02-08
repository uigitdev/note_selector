import 'package:note_selector/note_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    userLocator.observeUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouterLocator.initRoute(),
      routes: RouterLocator.routes(),
      onUnknownRoute: RouterLocator.unknownRoute(),
      navigatorKey: routerLocator.navigatorKey,
    );
  }
}
