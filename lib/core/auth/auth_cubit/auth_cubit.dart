import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../constants/app_const.dart';

import '../domain/entities/storayge_user.dart';
import '../domain/i_repository/i_auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final IAuthRepository authRepository;

  AuthCubit({
    required this.authRepository,
  }) : super(AuthIdle());

  Future<void> execGetStoraygeUserData({required String uid}) async {
    emit(
        const AuthLoading(currentOperationMessage: 'Retrieving storayge user'));
    final failureOrStoraygeUser =
        await authRepository.getStoraygeUserData(uid: uid);
    emit(
      failureOrStoraygeUser.fold(
          (failure) => AuthError(
                message: failure.message!,
                code: failure.code,
              ),
          (storaygeUser) => AuthLoaded(storaygeUser: storaygeUser)),
    );
  }

  Future<void> execRegisterWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(const AuthLoading(
      currentOperationMessage:
          OPERATION_MESSAGE_REGISTER_WITH_EMAIL_AND_PASSWORD,
    ));
    if (password == confirmPassword) {
      final failureOrRegister =
          await authRepository.registerWithEmailAndPassword(
        email: email,
        password: password,
        username: username,
      );
      emit(failureOrRegister.fold(
        (failure) => AuthError(
          message: failure.message!,
          code: failure.code,
        ),
        (storaygeUser) => AuthLoaded(storaygeUser: storaygeUser),
      ));
    } else {
      emit(const AuthErrorNotSamePassword(
          message: MESSAGE_NOT_SAME_PASSWORD, code: ERROR_NOT_SAME_PASSWORD));
    }
  }

  Future<void> execLoginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading(
        currentOperationMessage:
            OPERATION_MESSAGE_LOGIN_WITH_EMAIL_AND_PASSWORD));
    final failureOrLogin = await authRepository.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    emit(failureOrLogin.fold(
      (failure) => AuthError(
        message: failure.message!,
        code: failure.code,
      ),
      (storaygeUser) => AuthLoaded(storaygeUser: storaygeUser),
    ));
  }

  Future<void> execIsFirstTimeOpeningApp() async {
    // TODO : Create tests
    emit(const AuthLoading(
        currentOperationMessage:
            'Currently finding out if this is the first time you are opening the app.'));
    final failureOrBool = await authRepository.isFirstTimeOpeningApp();
    emit(failureOrBool.fold(
        (failure) => AuthError(
              message: failure.message!,
              code: failure.code,
            ),
        (retrievedBool) => AuthGeneralCompleted(content: retrievedBool)));
  }

  Future<void> execIsLoggedIn() async {
    // TODO : Create tests
    emit(const AuthLoading(
        currentOperationMessage: 'Currently verifying if you are logged in'));
    final notLoggedInOrStoraygeUser = await authRepository.isLoggedIn();
    emit(notLoggedInOrStoraygeUser.fold(
        (notLoggedIn) => AuthNotLoggedIn(),
        (storaygeUser) => AuthLoggedIn(
              storaygeUser: storaygeUser,
            )));
  }

  Future<void> execIsEmailNotRegistered({
    required String email,
  }) async {
    //TODO:create tests
    emit(const AuthLoading(
        currentOperationMessage:
            'Currently verifying if your email is available'));
    final failureOrBool = await authRepository.isEmailNotRegistered(email);
    emit(
      failureOrBool.fold(
        (failure) => AuthError(code: failure.code, message: failure.message!),
        (retrievedBool) => AuthGeneralCompleted(content: retrievedBool),
      ),
    );
  }

  Future<void> execGetUserUid() async {
    emit(const AuthLoading(currentOperationMessage: 'Retrieving uid'));
    final failureOrUid = await authRepository.getUid();

    emit(failureOrUid.fold(
      (failure) => AuthError(
        message: failure.message ?? 'No error message was provided',
      ),
      (uid) => AuthGeneralCompleted(content: uid),
    ));
  }

  Future<void> execSignOut() async {
    emit(const AuthLoading(currentOperationMessage: 'Signing out...'));

    final failureOrSignOut = await authRepository.signOut();

    emit(failureOrSignOut.fold(
      (f) => AuthError(
        message: f.message ?? "No error message was provided",
        code: f.code,
      ),
      (_) =>
          const AuthGeneralCompleted(content: 'Sign out operation succesfull'),
    ));
  }

  void emitIdle() {
    emit(AuthIdle());
  }

  // @override
  // void onChange(Change<AuthState> change) {
  //   print('Emitted state : $change');
  //   super.onChange(change);
  // }

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   print('Cubit met an error! Error : ${error.toString()}');
  //   super.onError(error, stackTrace);
  // }
}
