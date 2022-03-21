part of 'extension.dart';

class App {
  App._();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final RouteObserver routeObserver = RouteObserver();

  static final EventBus eventBus = EventBus();

  static BuildContext get context => navigatorKey.currentContext!;
}
