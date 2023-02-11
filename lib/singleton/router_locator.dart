import 'package:note_selector/note_selector.dart';

enum RouteName {
  auth(page: AuthPage()),
  home(page: HomePage());

  const RouteName({required this.page});

  final Widget page;
}

class RouteLocator {
  static final _instance = RouteLocator._internal();

  RouteLocator._internal();

  factory RouteLocator() => _instance;

  final _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  ///Stores all of available pages in the app.
  static Map<String, Widget Function(BuildContext)> routes() {
    final routes = <String, Widget Function(BuildContext)>{};
    for (var routeName in RouteName.values) {
      routes.putIfAbsent(_getPathByRouteName(routeName), () => (context) => routeName.page);
    }
    assert(routes.keys.length == RouteName.values.length, 'Missing route item'.toUpperCase());
    return routes;
  }

  static String _getPathByRouteName(RouteName routeName) => '/${routeName.name.toLowerCase()}';

  ///Starting page.
  static String initialRoute() => _getPathByRouteName(RouteName.auth);

  ///Defined unknown route in that case if the selected route is not exist.
  static Route<dynamic> Function(RouteSettings) unknownRoute() => (_) => MaterialPageRoute(builder: (_) => const UnknownPage());

  ///Open page by [RouteName].
  void openPageByRouteName(RouteName routeName, {Map<String, dynamic> args = const {}}) => _navigatorKey.currentState!.pushNamed(_getPathByRouteName(routeName), arguments: args);

  ///Close the current page.
  void closePage() => _navigatorKey.currentState!.pop();

  ///Close all of opened pages. Example:. to navigate to the first page if the user sign out.
  void closeAll(RouteName routeName) => _navigatorKey.currentState!.pushNamedAndRemoveUntil(_getPathByRouteName(routeName), (route) => false);

  ///Get dropped arguments. If no arguments is dropped the map will be empty.
  static Map<String, dynamic> getArguments(BuildContext context) => (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;
}
