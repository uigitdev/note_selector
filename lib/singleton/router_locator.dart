import 'package:note_selector/note_selector.dart';

enum RouterName {
  auth('/auth');

  const RouterName(this.path);

  final String path;
}

class RouterLocator {
  static final _instance = RouterLocator._internal();

  RouterLocator._internal();

  factory RouterLocator() => _instance;

  final navigatorKey = GlobalKey<NavigatorState>();

  ///Stores all of available pages in the app.
  static Map<String, Widget Function(BuildContext)> routes() {
    final routes = <String, Widget Function(BuildContext)>{};
    routes.putIfAbsent(RouterName.auth.path, () => (context) => const AuthPage());

    assert(routes.keys.length == RouterName.values.length, 'Missing route item'.toUpperCase());
    return routes;
  }

  ///Starting page.
  static String initRoute() => RouterName.auth.path;

  ///Defined unknown router in that case if the selected route is not exist.
  static Route<dynamic> Function(RouteSettings) unknownRoute() => (_) => MaterialPageRoute(builder: (_) => const UnknownPage());

  ///Open page by [RouterName].
  void openPageByName(RouterName routerName, {Map<String, dynamic> args = const {}}) => navigatorKey.currentState!.pushNamed(routerName.path, arguments: args);

  ///Close the current page.
  void closePage() => navigatorKey.currentState!.pop();

  ///Close all of opened pages. Example:. to navigate to the first page if the user sign out.
  void closeAll(RouterName routerName) => navigatorKey.currentState!.pushNamedAndRemoveUntil(routerName.path, (route) => false);

  ///Get dropped arguments. If no arguments is dropped the map will be empty.
  static Map<String, dynamic> getArguments(BuildContext context) => (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;
}