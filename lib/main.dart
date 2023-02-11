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
      title: Textbook.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteLocator.initialRoute(),
      routes: RouteLocator.routes(),
      onUnknownRoute: RouteLocator.unknownRoute(),
      navigatorKey: routeLocator.navigatorKey,
    );
  }
}
