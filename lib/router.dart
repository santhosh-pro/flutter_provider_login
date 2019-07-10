import 'package:flutter/material.dart';
import 'package:flutter_provider_login/application_page.dart';
import 'package:flutter_provider_login/login_page.dart';
import 'package:flutter_provider_login/second_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case RoutePaths.Second:
        return MaterialPageRoute(builder: (_) => SecondPage());
      case RoutePaths.Application:
        return MaterialPageRoute(builder: (_) => ApplicationPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

class RoutePaths {
  static const String Application = '/';
  static const String Login = 'login';
  static const String Second = 'second';
}
