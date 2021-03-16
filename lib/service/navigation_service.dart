import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';

// @singleton
class NavigationService {
  factory NavigationService() => _instance;
  static final NavigationService _instance = NavigationService._internal();
  NavigationService._internal();
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {arguments}) async =>
      navigationKey.currentState!.pushNamed(routeName, arguments: arguments);

  Future<dynamic> navigateToReplace(String routeName, {arguments}) async =>
      navigationKey.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);

  dynamic goBack([dynamic popValue]) {
    return navigationKey.currentState!.pop(popValue);
  }

  Future<bool> maybePop<T>([T? data]) =>
      navigationKey.currentState!.maybePop(data);

  void popToHome() =>
      navigationKey.currentState!.popUntil((route) => route.isFirst);
}
