import 'package:flutter/material.dart';

class NavigationServiceHome extends _NavigationService {
  NavigationServiceHome() : super(GlobalKey<NavigatorState>());
}

class NavigationServiceMain extends _NavigationService {
  NavigationServiceMain() : super(GlobalKey<NavigatorState>());
}

class _NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;
  String activeTitle = '';

  _NavigationService(this.navigatorKey);

  void pop<T extends Object>([T? result]) {
    return navigatorKey.currentState?.pop();
  }

  void popUntil(bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState?.popUntil(predicate);
  }

  Future<Object?>? pushNamed(String routeName, {Object? args}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }

  Future<Object?>? pushReplacementNamed(String routeName, {Object? args}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: args);
  }

  Future<Object?>? pushRemoveUntil(String routeName, {Object? args}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: args);
  }
}
