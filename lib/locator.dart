import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/core/auth/data/datasources/auth_local_data_source.dart';
import 'package:storayge/core/auth/data/datasources/auth_remote_data_source.dart';
import 'package:storayge/core/auth/data/repository/auth_repository_impl.dart';
import 'package:storayge/core/auth/domain/repository/auth_repository.dart';
import 'package:storayge/core/auth/domain/usecases/get_storayge_userdata_from_remote.dart';

import 'core/network/network_info.dart';

final GetIt locator = GetIt.instance;

Future<void>? setupLocator() {
  //! Features

  //! Core
  //*   Auth
  // Bloc and Cubits
  locator.registerFactory(
      () => AuthCubit(getStoraygeUserDataFromRemote: locator()));
  // Usecases
  locator.registerLazySingleton(
      () => GetStoraygeUserDataFromRemote(repository: locator()));
  // Repository
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: locator(),
        localDataSource: locator(),
        networkInfo: locator(),
      ));
  // Data Sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(firebaseFirestore: locator()));
  locator.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(hiveInterface: locator()));

  //*   NetworkInfo
  locator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: locator()));

  //! External
  //*   Firebase
  locator.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  locator.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  //*   Hive
  // TODO : Verify that this is the proper way to inject Hive. Errors may stem from this.
  locator.registerSingleton<HiveInterface>(Hive);
  //locator.registerSingleton<Box>(BoxBase());

  //*   InternetConnectionChecker
  locator.registerSingleton(InternetConnectionChecker());
}
