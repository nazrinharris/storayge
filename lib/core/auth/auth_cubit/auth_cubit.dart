import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:storayge/core/auth/domain/entities/storayge_user.dart';
import 'package:storayge/core/auth/domain/usecases/get_storayge_userdata_from_remote.dart';
import 'package:storayge/core/usecases/params.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final GetStoraygeUserDataFromRemote getStoraygeUserDataFromRemote;

  AuthCubit({
    required this.getStoraygeUserDataFromRemote,
  }) : super(AuthIdle());

  Future<void> getStoraygeUserData({required String uid}) async {
    emit(AuthLoading());
    final failureOrStoraygeUser =
        await getStoraygeUserDataFromRemote(UidParams(uid: uid));
    emit(
      failureOrStoraygeUser.fold(
          (failure) => AuthError(
                message: failure.message!,
                code: failure.code,
              ),
          (storaygeUser) =>
              AuthGetStoraygeUserCompleted(storaygeUser: storaygeUser)),
    );
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
