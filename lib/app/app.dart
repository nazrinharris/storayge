import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:storayge/ui/views/home/home_view.dart';
import 'package:storayge/ui/views/login/login_view.dart';
import 'package:storayge/ui/views/register/register_view.dart';

import 'package:storayge/ui/views/start/start_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: FirebaseAuthenticationService),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
