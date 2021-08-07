import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:storayge/presentation/shared/local_theme.dart';
import 'package:storayge/presentation/views/home/home_view.dart';
import 'package:storayge/presentation/views/login/login_view.dart';
import 'package:storayge/presentation/views/main/main_view.dart';
import 'package:storayge/presentation/views/start/start_view.dart';
import 'package:storayge/presentation/views/testing/navigate_view.dart';

import 'app_router.dart';
import 'core/auth/auth_cubit/auth_cubit.dart';
import 'core/auth/data/models/storayge_user_model.dart';
import 'core/util/app_bloc_observer.dart';
import 'features/cabinet/bloc/cabinet_cubit.dart';
import 'features/cabinet/data/models/shelf_model.dart';
import 'locator.dart';
import 'presentation/views/register/register_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(StoraygeUserModelAdapter());
  Hive.registerAdapter(ShelfModelAdapter());

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();

  await setupLocator();

  runApp(
    StoraygeApp(
      appRouter: AppRouter(),
    ),
  );
}

class StoraygeApp extends StatelessWidget {
  final AppRouter appRouter;

  const StoraygeApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext widgetContext) {
    return ScreenUtilInit(
      designSize: const Size(414, 893),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            //lazy: false,
            create: (context) => locator<CabinetCubit>(),
          ),
          BlocProvider(
            create: (context) => locator<AuthCubit>(),
          ),
        ],
        child: MaterialApp(
          theme: AppTheme.darkTheme,
          title: 'Storayge',
          // home: NavigateView(),
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
