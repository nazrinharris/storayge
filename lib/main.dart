import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';
import 'package:storayge/core/constants/app_paths.dart';

import 'app_router.dart';
import 'auth_domain_blocs/auth_bloc/authentication_bloc.dart';
import 'auth_domain_blocs/register_bloc/register_cubit.dart';
import 'core/auth/data/models/storayge_user_model.dart';
import 'core/utility/app_bloc_observer.dart';
import 'locator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(StoraygeUserModelAdapter());

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();

  setupLocator();

  runApp(StoraygeApp(
    appRouter: AppRouter(),
  ));
}

class StoraygeApp extends StatelessWidget {
  final AppRouter appRouter;

  const StoraygeApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'Storayge',
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
