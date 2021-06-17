import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'presentation/smart_widgets/two_pagination_progress/two_pagination_progress_cubit.dart';
import 'presentation/views/register/register_cubit/register_view_cubit.dart';
import 'core/auth/domain/usecases/get_uid.dart';
import 'features/cabinet/bloc/cabinet_cubit.dart';
import 'features/cabinet/data/datasources/cabinet_remote_datasource.dart';
import 'features/cabinet/data/repository/cabinet_repository_impl.dart';
import 'features/cabinet/domain/repository/cabinet_repository.dart';
import 'features/cabinet/domain/usecases/get_shelf.dart';
import 'features/cabinet/domain/usecases/store_shelf.dart';

import 'core/auth/auth_cubit/auth_cubit.dart';
import 'core/auth/data/datasources/auth_local_data_source.dart';
import 'core/auth/data/datasources/auth_remote_data_source.dart';
import 'core/auth/data/repository/auth_repository_impl.dart';
import 'core/auth/domain/repository/auth_repository.dart';
import 'core/auth/domain/usecases/get_storayge_userdata_from_remote.dart';
import 'core/auth/domain/usecases/login_with_email_and_password.dart';
import 'core/auth/domain/usecases/register_with_email_and_password.dart';

import 'core/auth/domain/usecases/sign_out.dart';
import 'core/network/network_info.dart';
import 'features/cabinet/data/datasources/cabinet_local_datasource.dart';

final GetIt locator = GetIt.instance;

Future<void>? setupLocator() {
  //! Views
  //Bloc and Cubits
  locator.registerFactory(() => RegisterViewCubit());

  //! Features
  // Bloc and Cubits
  locator.registerFactory(() => CabinetCubit(
        getShelf: locator(),
        storeShelf: locator(),
      ));

  // Usecases
  locator.registerLazySingleton(() => GetShelf(repository: locator()));
  locator.registerLazySingleton(() => StoreShelf(locator()));

  // Repository
  locator.registerLazySingleton<CabinetRepository>(() => CabinetRepositoryImpl(
        remoteDataSource: locator(),
        localDataSource: locator(),
        networkInfo: locator(),
      ));
  // Datasources
  locator.registerLazySingleton<CabinetLocalDataSource>(
      () => CabinetLocalDataSourceImpl(hiveInterface: locator()));
  locator.registerLazySingleton<CabinetRemoteDataSource>(
      () => CabinetRemoteDataSourceImpl(firebaseFirestore: locator()));

  //! Core
  //*   Auth
  // Bloc and Cubits
  locator.registerFactory(() => AuthCubit(
        getStoraygeUserDataFromRemote: locator(),
        loginWithEmailAndPassword: locator(),
        registerWithEmailAndPassword: locator(),
        authRepository: locator(),
      ));
  // Usecases
  locator.registerLazySingleton(
      () => GetStoraygeUserDataFromRemote(repository: locator()));
  locator.registerLazySingleton(
      () => LoginWithEmailAndPassword(repository: locator()));
  locator.registerLazySingleton(
      () => RegisterWithEmailAndPassword(repository: locator()));
  locator.registerLazySingleton(() => GetUid(repository: locator()));
  locator.registerLazySingleton(() => SignOut(locator()));
  // Repository
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        remoteDataSource: locator(),
        localDataSource: locator(),
        networkInfo: locator(),
      ));
  // Data Sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
            firebaseFirestore: locator(),
            firebaseAuth: locator(),
          ));
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
  locator.registerSingleton<HiveInterface>(Hive);

  //*   InternetConnectionChecker
  locator.registerSingleton(InternetConnectionChecker());
}
