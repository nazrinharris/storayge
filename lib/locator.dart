import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:storayge/features/cabinet/cubit/cabinet_cubit.dart';

import 'core/auth/auth_cubit/auth_cubit.dart';
import 'core/auth/data/datasources/auth_local_datasource.dart';
import 'core/auth/data/datasources/auth_remote_datasource.dart';
import 'core/auth/data/repository/auth_repository.dart';
import 'core/auth/domain/i_repository/i_auth_repository.dart';
import 'core/network/network_info.dart';

import 'features/cabinet/data/datasources/cabinet_local_datasource.dart';
import 'features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'features/cabinet/data/repository/cabinet_repository.dart';
import 'features/cabinet/domain/i_repository/i_cabinet_repository.dart';

final GetIt locator = GetIt.instance;

Future<void>? setupLocator() {
  //! Views
  //Bloc and Cubits

  //! Features
  // Bloc and Cubits
  locator.registerFactory(() => CabinetCubit(
        cabinetRepository: locator(),
      ));

  // Repository
  locator.registerLazySingleton<ICabinetRepository>(() => CabinetRepository(
        remoteDataSource: locator(),
        localDataSource: locator(),
        networkInfo: locator(),
      ));
  // Datasources
  locator.registerLazySingleton<CabinetLocalDataSource>(
      () => CabinetLocalDataSource(hiveInterface: locator()));
  locator.registerLazySingleton<CabinetRemoteDataSource>(
      () => CabinetRemoteDataSource(firebaseFirestore: locator()));

  //! Core
  //*   Auth
  // Bloc and Cubits
  locator.registerFactory(() => AuthCubit(
        authRepository: locator(),
      ));
  // Repository
  locator.registerLazySingleton<IAuthRepository>(() => AuthRepository(
        remoteDataSource: locator(),
        localDataSource: locator(),
        networkInfo: locator(),
      ));
  // Data Sources
  locator
      .registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(
            firebaseFirestore: locator(),
            firebaseAuth: locator(),
          ));
  locator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(hiveInterface: locator()));

  //*   NetworkInfo
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: locator()));

  //! External
  //*   Firebase
  locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  //*   Hive
  locator.registerSingleton<HiveInterface>(Hive);

  //*   InternetConnectionChecker
  locator.registerSingleton(InternetConnectionChecker());
}
