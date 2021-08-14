import 'package:flutter/material.dart';

/// Main Navigation used to navigate between screen, inharitance
/// from [_NavigationService], it injected so it can easly call the methods
class NavigationServiceMain extends _NavigationService {
  /// Constructor that initializes the navigation service Key
  NavigationServiceMain() : super(GlobalKey<NavigatorState>());
}

abstract class _NavigationService {
  /// Constructotr that use the [NavigatorState] so it can be called everywhere
  _NavigationService(this.navigatorKey);

  final GlobalKey<NavigatorState> navigatorKey;

  void pop() {
    return navigatorKey.currentState!.pop();
  }

  void popUntil(bool Function(Route<dynamic>) predicate) {
    return navigatorKey.currentState!.popUntil(predicate);
  }

  Future<dynamic> pushNamed(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  Future<dynamic> pushRemoveAllRoutes(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: args);
  }
}
