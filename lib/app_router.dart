import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'presentation/views/login/login_view.dart';
import 'presentation/views/register/register_view.dart';
import 'presentation/views/start/start_view.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => const StartView());
      case '/login':
        return CupertinoPageRoute(builder: (_) => const LoginView());
      case '/register':
        return CupertinoPageRoute(builder: (_) => const RegisterView());
      default:
        throw Exception('UnknownRoute called');
    }
  }
}
