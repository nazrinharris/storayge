import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../constants/app_const.dart';
import '../../usecases/params.dart';

import '../domain/entities/storayge_user.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/usecases/get_storayge_userdata_from_remote.dart';
import '../domain/usecases/login_with_email_and_password.dart';
import '../domain/usecases/register_with_email_and_password.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetStoraygeUserDataFromRemote getStoraygeUserDataFromRemote;
  final LoginWithEmailAndPassword loginWithEmailAndPassword;
  final RegisterWithEmailAndPassword registerWithEmailAndPassword;

  final AuthRepository authRepository;

  AuthCubit({
    required this.getStoraygeUserDataFromRemote,
    required this.loginWithEmailAndPassword,
    required this.registerWithEmailAndPassword,
    required this.authRepository,
  }) : super(AuthIdle());

  Future<void> getStoraygeUserDataRun({required String uid}) async {
    emit(
        const AuthLoading(currentOperationMessage: 'Retrieving storayge user'));
    final failureOrStoraygeUser =
        await getStoraygeUserDataFromRemote(UidParams(uid: uid));
    emit(
      failureOrStoraygeUser.fold(
          (failure) => AuthError(
                message: failure.message!,
                code: failure.code,
              ),
          (storaygeUser) => AuthLoaded(storaygeUser: storaygeUser)),
    );
  }

  Future<void> registerWithEmailAndPasswordRun({
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
          await registerWithEmailAndPassword(RegisterParams(
        email: email,
        password: password,
        username: username,
      ));
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

  Future<void> loginWithEmailAndPasswordRun({
    required String email,
    required String password,
  }) async {
    emit(const AuthLoading(
        currentOperationMessage:
            OPERATION_MESSAGE_LOGIN_WITH_EMAIL_AND_PASSWORD));
    final failureOrLogin = await loginWithEmailAndPassword(LoginParams(
      email: email,
      password: password,
    ));
    emit(failureOrLogin.fold(
      (failure) => AuthError(
        message: failure.message!,
        code: failure.code,
      ),
      (storaygeUser) => AuthLoaded(storaygeUser: storaygeUser),
    ));
  }

  Future<void> isFirstTimeOpeningAppRun() async {
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

  Future<void> isLoggedInRun() async {
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
