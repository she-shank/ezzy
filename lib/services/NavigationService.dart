import 'package:flutter/material.dart';

class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {String argument}) {
    if(argument == null){
      return navigatorKey.currentState.pushNamed(routeName);
    }else {
      return navigatorKey.currentState.pushNamed(routeName, arguments: argument);
    }
  }

  Future<dynamic> pushReplacementNamed(String routeName, {String argument}) {
    if(argument == null){
      return navigatorKey.currentState.pushReplacementNamed(routeName);
    }else {
      return navigatorKey.currentState.pushReplacementNamed(routeName, arguments: argument);
    }
  }

  void pop() {
    return navigatorKey.currentState.pop();
  }

}