import 'package:note_selector/note_selector.dart';

enum RouterName {
  auth(page: AuthPage()),
  home(page: HomePage());

  const RouterName({required this.page});

  final Widget page;
}

class RouterLocator {
  static final _instance = RouterLocator._internal();

  RouterLocator._internal();

  factory RouterLocator() => _instance;

  final _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  ///Stores all of available pages in the app.
  static Map<String, Widget Function(BuildContext)> routes() {
    final routes = <String, Widget Function(BuildContext)>{};
    for (var routerName in RouterName.values) {
      routes.putIfAbsent(_getPathByRouter(routerName), () => (context) => routerName.page);
    }
    assert(routes.keys.length == RouterName.values.length, 'Missing route item'.toUpperCase());
    return routes;
  }

  static String _getPathByRouter(RouterName routerName) => '/${routerName.name.toLowerCase()}';

  ///Starting page.
  static String initRoute() => _getPathByRouter(RouterName.auth);

  ///Defined unknown router in that case if the selected route is not exist.
  static Route<dynamic> Function(RouteSettings) unknownRoute() => (_) => MaterialPageRoute(builder: (_) => const UnknownPage());

  ///Open page by [RouterName].
  void openPageByName(RouterName routerName, {Map<String, dynamic> args = const {}}) => _navigatorKey.currentState!.pushNamed(_getPathByRouter(routerName), arguments: args);

  ///Close the current page.
  void closePage() => _navigatorKey.currentState!.pop();

  ///Close all of opened pages. Example:. to navigate to the first page if the user sign out.
  void closeAll(RouterName routerName) => _navigatorKey.currentState!.pushNamedAndRemoveUntil(_getPathByRouter(routerName), (route) => false);

  ///Get dropped arguments. If no arguments is dropped the map will be empty.
  static Map<String, dynamic> getArguments(BuildContext context) => (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map<String, dynamic>;
}
