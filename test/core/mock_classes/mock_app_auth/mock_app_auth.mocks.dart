// Mocks generated by Mockito 5.0.14 from annotations
// in storayge/test/core/mock_classes/mock_app_auth/mock_app_auth.dart.
// Do not manually edit this file.

import 'dart:async' as _i8;

import 'package:fpdart/fpdart.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:storayge/core/auth/data/datasources/auth_local_data_source.dart'
    as _i4;
import 'package:storayge/core/auth/data/datasources/auth_remote_data_source.dart'
    as _i3;
import 'package:storayge/core/auth/data/models/storayge_user_model.dart' as _i6;
import 'package:storayge/core/auth/data/repository/auth_repository_impl.dart'
    as _i11;
import 'package:storayge/core/auth/domain/entities/storayge_user.dart' as _i10;
import 'package:storayge/core/auth/domain/repository/auth_repository.dart'
    as _i7;
import 'package:storayge/core/auth/domain/usecases/get_storayge_userdata_from_remote.dart'
    as _i12;
import 'package:storayge/core/auth/domain/usecases/get_uid.dart' as _i16;
import 'package:storayge/core/auth/domain/usecases/login_with_email_and_password.dart'
    as _i14;
import 'package:storayge/core/auth/domain/usecases/register_with_email_and_password.dart'
    as _i15;
import 'package:storayge/core/errors/failures.dart' as _i9;
import 'package:storayge/core/network/network_info.dart' as _i5;
import 'package:storayge/core/usecases/params.dart' as _i13;
import 'package:storayge/core/usecases/usecase.dart' as _i17;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeAuthRemoteDataSource_1 extends _i1.Fake
    implements _i3.AuthRemoteDataSource {}

class _FakeAuthLocalDataSource_2 extends _i1.Fake
    implements _i4.AuthLocalDataSource {}

class _FakeNetworkInfo_3 extends _i1.Fake implements _i5.NetworkInfo {}

class _FakeStoraygeUserModel_4 extends _i1.Fake
    implements _i6.StoraygeUserModel {}

class _FakeUnit_5 extends _i1.Fake implements _i2.Unit {}

class _FakeAuthRepository_6 extends _i1.Fake implements _i7.AuthRepository {}

/// A class which mocks [AuthRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepository extends _i1.Mock implements _i7.AuthRepository {
  MockAuthRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>
      getStoraygeUserDataFromRemote({String? uid}) => (super.noSuchMethod(
          Invocation.method(#getStoraygeUserDataFromRemote, [], {#uid: uid}),
          returnValue: Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
              _FakeEither_0<_i9.Failure, _i10.StoraygeUser>())) as _i8
          .Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>
      loginWithEmailAndPassword({String? email, String? password}) => (super
              .noSuchMethod(
                  Invocation.method(#loginWithEmailAndPassword, [], {
                    #email: email,
                    #password: password
                  }),
                  returnValue:
                      Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
                          _FakeEither_0<_i9.Failure, _i10.StoraygeUser>()))
          as _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>
      registerWithEmailAndPassword(
              {String? email, String? password, String? username}) =>
          (super.noSuchMethod(
                  Invocation.method(#registerWithEmailAndPassword, [], {
                    #email: email,
                    #password: password,
                    #username: username
                  }),
                  returnValue:
                      Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
                          _FakeEither_0<_i9.Failure, _i10.StoraygeUser>()))
              as _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> getUid() =>
      (super.noSuchMethod(Invocation.method(#getUid, []),
              returnValue: Future<_i2.Either<_i9.Failure, String>>.value(
                  _FakeEither_0<_i9.Failure, String>()))
          as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i2.Unit>> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: Future<_i2.Either<_i9.Failure, _i2.Unit>>.value(
                  _FakeEither_0<_i9.Failure, _i2.Unit>()))
          as _i8.Future<_i2.Either<_i9.Failure, _i2.Unit>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, bool>> isFirstTimeOpeningApp() =>
      (super.noSuchMethod(Invocation.method(#isFirstTimeOpeningApp, []),
              returnValue: Future<_i2.Either<_i9.Failure, bool>>.value(
                  _FakeEither_0<_i9.Failure, bool>()))
          as _i8.Future<_i2.Either<_i9.Failure, bool>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>> isLoggedIn() =>
      (super.noSuchMethod(Invocation.method(#isLoggedIn, []),
          returnValue: Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
              _FakeEither_0<_i9.Failure, _i10.StoraygeUser>())) as _i8
          .Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, bool>> isEmailNotRegistered(
          String? email) =>
      (super.noSuchMethod(Invocation.method(#isEmailNotRegistered, [email]),
              returnValue: Future<_i2.Either<_i9.Failure, bool>>.value(
                  _FakeEither_0<_i9.Failure, bool>()))
          as _i8.Future<_i2.Either<_i9.Failure, bool>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AuthRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepositoryImpl extends _i1.Mock
    implements _i11.AuthRepositoryImpl {
  MockAuthRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.AuthRemoteDataSource get remoteDataSource => (super.noSuchMethod(
      Invocation.getter(#remoteDataSource),
      returnValue: _FakeAuthRemoteDataSource_1()) as _i3.AuthRemoteDataSource);
  @override
  _i4.AuthLocalDataSource get localDataSource => (super.noSuchMethod(
      Invocation.getter(#localDataSource),
      returnValue: _FakeAuthLocalDataSource_2()) as _i4.AuthLocalDataSource);
  @override
  _i5.NetworkInfo get networkInfo =>
      (super.noSuchMethod(Invocation.getter(#networkInfo),
          returnValue: _FakeNetworkInfo_3()) as _i5.NetworkInfo);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>
      getStoraygeUserDataFromRemote({String? uid}) => (super.noSuchMethod(
          Invocation.method(#getStoraygeUserDataFromRemote, [], {#uid: uid}),
          returnValue: Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
              _FakeEither_0<_i9.Failure, _i10.StoraygeUser>())) as _i8
          .Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>
      loginWithEmailAndPassword({String? email, String? password}) => (super
              .noSuchMethod(
                  Invocation.method(#loginWithEmailAndPassword, [], {
                    #email: email,
                    #password: password
                  }),
                  returnValue:
                      Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
                          _FakeEither_0<_i9.Failure, _i10.StoraygeUser>()))
          as _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>
      registerWithEmailAndPassword(
              {String? email, String? password, String? username}) =>
          (super.noSuchMethod(
                  Invocation.method(#registerWithEmailAndPassword, [], {
                    #email: email,
                    #password: password,
                    #username: username
                  }),
                  returnValue:
                      Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
                          _FakeEither_0<_i9.Failure, _i10.StoraygeUser>()))
              as _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> getUid() =>
      (super.noSuchMethod(Invocation.method(#getUid, []),
              returnValue: Future<_i2.Either<_i9.Failure, String>>.value(
                  _FakeEither_0<_i9.Failure, String>()))
          as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i2.Unit>> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: Future<_i2.Either<_i9.Failure, _i2.Unit>>.value(
                  _FakeEither_0<_i9.Failure, _i2.Unit>()))
          as _i8.Future<_i2.Either<_i9.Failure, _i2.Unit>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, bool>> isFirstTimeOpeningApp() =>
      (super.noSuchMethod(Invocation.method(#isFirstTimeOpeningApp, []),
              returnValue: Future<_i2.Either<_i9.Failure, bool>>.value(
                  _FakeEither_0<_i9.Failure, bool>()))
          as _i8.Future<_i2.Either<_i9.Failure, bool>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>> isLoggedIn() =>
      (super.noSuchMethod(Invocation.method(#isLoggedIn, []),
          returnValue: Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
              _FakeEither_0<_i9.Failure, _i10.StoraygeUser>())) as _i8
          .Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  _i8.Future<_i2.Either<_i9.Failure, bool>> isEmailNotRegistered(
          String? email) =>
      (super.noSuchMethod(Invocation.method(#isEmailNotRegistered, [email]),
              returnValue: Future<_i2.Either<_i9.Failure, bool>>.value(
                  _FakeEither_0<_i9.Failure, bool>()))
          as _i8.Future<_i2.Either<_i9.Failure, bool>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AuthRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRemoteDataSource extends _i1.Mock
    implements _i3.AuthRemoteDataSource {
  MockAuthRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i6.StoraygeUserModel> getStoraygeUserDataFromRemote(
          {String? uid}) =>
      (super.noSuchMethod(
          Invocation.method(#getStoraygeUserDataFromRemote, [], {#uid: uid}),
          returnValue: Future<_i6.StoraygeUserModel>.value(
              _FakeStoraygeUserModel_4())) as _i8
          .Future<_i6.StoraygeUserModel>);
  @override
  _i8.Future<_i6.StoraygeUserModel> loginWithEmailAndPassword(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#loginWithEmailAndPassword, [],
                  {#email: email, #password: password}),
              returnValue: Future<_i6.StoraygeUserModel>.value(
                  _FakeStoraygeUserModel_4()))
          as _i8.Future<_i6.StoraygeUserModel>);
  @override
  _i8.Future<_i6.StoraygeUserModel> registerWithEmailAndPassword(
          {String? email, String? password, String? username}) =>
      (super.noSuchMethod(
              Invocation.method(#registerWithEmailAndPassword, [],
                  {#email: email, #password: password, #username: username}),
              returnValue: Future<_i6.StoraygeUserModel>.value(
                  _FakeStoraygeUserModel_4()))
          as _i8.Future<_i6.StoraygeUserModel>);
  @override
  _i8.Future<_i6.StoraygeUserModel> isLoggedIn() => (super.noSuchMethod(
          Invocation.method(#isLoggedIn, []),
          returnValue:
              Future<_i6.StoraygeUserModel>.value(_FakeStoraygeUserModel_4()))
      as _i8.Future<_i6.StoraygeUserModel>);
  @override
  _i8.Future<bool> isEmailNotRegistered(String? email) =>
      (super.noSuchMethod(Invocation.method(#isEmailNotRegistered, [email]),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<String> getUid() =>
      (super.noSuchMethod(Invocation.method(#getUid, []),
          returnValue: Future<String>.value('')) as _i8.Future<String>);
  @override
  _i8.Future<_i2.Unit> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: Future<_i2.Unit>.value(_FakeUnit_5()))
          as _i8.Future<_i2.Unit>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [AuthLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthLocalDataSource extends _i1.Mock
    implements _i4.AuthLocalDataSource {
  MockAuthLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Future<_i6.StoraygeUserModel> getCachedStoraygeUser() =>
      (super.noSuchMethod(Invocation.method(#getCachedStoraygeUser, []),
              returnValue: Future<_i6.StoraygeUserModel>.value(
                  _FakeStoraygeUserModel_4()))
          as _i8.Future<_i6.StoraygeUserModel>);
  @override
  _i8.Future<void> cacheStoraygeUser(
          _i6.StoraygeUserModel? storaygeUserToCache) =>
      (super.noSuchMethod(
          Invocation.method(#cacheStoraygeUser, [storaygeUserToCache]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i8.Future<void>);
  @override
  _i8.Future<bool> isFirstTimeOpeningApp() =>
      (super.noSuchMethod(Invocation.method(#isFirstTimeOpeningApp, []),
          returnValue: Future<bool>.value(false)) as _i8.Future<bool>);
  @override
  _i8.Future<_i6.StoraygeUserModel> getCurrentUser() => (super.noSuchMethod(
          Invocation.method(#getCurrentUser, []),
          returnValue:
              Future<_i6.StoraygeUserModel>.value(_FakeStoraygeUserModel_4()))
      as _i8.Future<_i6.StoraygeUserModel>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetStoraygeUserDataFromRemote].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetStoraygeUserDataFromRemote extends _i1.Mock
    implements _i12.GetStoraygeUserDataFromRemote {
  MockGetStoraygeUserDataFromRemote() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.AuthRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeAuthRepository_6()) as _i7.AuthRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>> call(
          _i13.UidParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
              _FakeEither_0<_i9.Failure, _i10.StoraygeUser>())) as _i8
          .Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [LoginWithEmailAndPassword].
///
/// See the documentation for Mockito's code generation for more information.
class MockLoginWithEmailAndPassword extends _i1.Mock
    implements _i14.LoginWithEmailAndPassword {
  MockLoginWithEmailAndPassword() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.AuthRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeAuthRepository_6()) as _i7.AuthRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>> call(
          _i13.LoginParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
              _FakeEither_0<_i9.Failure, _i10.StoraygeUser>())) as _i8
          .Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [RegisterWithEmailAndPassword].
///
/// See the documentation for Mockito's code generation for more information.
class MockRegisterWithEmailAndPassword extends _i1.Mock
    implements _i15.RegisterWithEmailAndPassword {
  MockRegisterWithEmailAndPassword() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.AuthRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeAuthRepository_6()) as _i7.AuthRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>> call(
          _i13.RegisterParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
          returnValue: Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>.value(
              _FakeEither_0<_i9.Failure, _i10.StoraygeUser>())) as _i8
          .Future<_i2.Either<_i9.Failure, _i10.StoraygeUser>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [GetUid].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUid extends _i1.Mock implements _i16.GetUid {
  MockGetUid() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.AuthRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeAuthRepository_6()) as _i7.AuthRepository);
  @override
  _i8.Future<_i2.Either<_i9.Failure, String>> call(_i17.NoParams? params) =>
      (super.noSuchMethod(Invocation.method(#call, [params]),
              returnValue: Future<_i2.Either<_i9.Failure, String>>.value(
                  _FakeEither_0<_i9.Failure, String>()))
          as _i8.Future<_i2.Either<_i9.Failure, String>>);
  @override
  String toString() => super.toString();
}
