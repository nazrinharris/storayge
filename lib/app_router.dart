import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storayge/presentation/views/main/main_view.dart';
import 'package:storayge/presentation/views/testing/navigate_view.dart';
import 'package:storayge/presentation/views/testing/test_view.dart';
import 'presentation/views/login/login_view.dart';
import 'presentation/views/register/register_view.dart';
import 'presentation/views/splash/splash_view.dart';
import 'presentation/views/start/start_view.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => NavigateView());
      case '/start':
        return CupertinoPageRoute(builder: (_) => const StartView());
      case '/login':
        return CupertinoPageRoute(builder: (_) => const LoginView());
      case '/register':
        return CupertinoPageRoute(builder: (_) => const RegisterView());
      case '/main':
        return CupertinoPageRoute(builder: (_) => const MainView());
      case '/test':
        return CupertinoPageRoute(builder: (_) => const TestView());
      default:
        throw Exception('UnknownRoute called');
    }
  }
}
