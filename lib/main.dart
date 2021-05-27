import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/presentation/views/home/home_view.dart';

import 'app_router.dart';
import 'auth_domain_blocs/auth_bloc/authentication_bloc.dart';
import 'auth_domain_blocs/register_bloc/register_cubit.dart';
import 'core/auth/data/models/storayge_user_model.dart';
import 'core/util/app_bloc_observer.dart';
import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(StoraygeUserModelAdapter());

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();

  await setupLocator();

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
          //lazy: false,
          create: (context) => locator<AuthCubit>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: 'Storayge',
        home: const HomeView(),
        //onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
