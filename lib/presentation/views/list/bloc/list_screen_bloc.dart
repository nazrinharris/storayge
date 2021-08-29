import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/core/errors/exceptions.dart';
import 'package:storayge/features/cabinet/bloc/cabinet_cubit.dart';
import 'package:storayge/features/cabinet/domain/entities/storayge_group.dart';

part 'list_screen_event.dart';
part 'list_screen_state.dart';
part 'list_screen_bloc.freezed.dart';

class ListScreenBloc extends Bloc<ListScreenEvent, ListScreenState> {
  final CabinetCubit cabinetCubit;
  final AuthCubit authCubit;

  ListScreenBloc({
    required this.authCubit,
    required this.cabinetCubit,
  }) : super(const LSInitial()) {
    on<_Started>(start);
    on<LSexecGetAllListSGSnip>(execGetAllListSGSnip);
  }

  FutureOr<void> start(
    ListScreenEvent event,
    Emitter<ListScreenState> emit,
  ) {
    emit(state);
  }

  FutureOr<void> execGetAllListSGSnip(
    ListScreenEvent event,
    Emitter<ListScreenState> emit,
  ) async {
    print('execGetAllListSGSnip started');

    emit(const ListScreenState.loading(
        currentOperationMessage: 'Retrieving your groups..'));

    String uid;

    await authCubit.execGetUserUid().then((_) async {
      print('execGetUserUid completed');

      AuthState authState = authCubit.state;

      if (authState is AuthGeneralCompleted) {
        print('UID Retrieved');
        uid = authState.content;

        await cabinetCubit.execGetAllList(uid: uid).then(
          (_) async {
            CabinetState cabinetState = cabinetCubit.state;

            if (cabinetState is CabinetLoadedGetAllListSGSnip) {
              emit(ListScreenState.loadedAllListSGSnip(
                  cabinetState.allListSGSnip));
            } else if (cabinetState is CabinetErrorGetAllListSGSnip) {
              emit(ListScreenState.error(
                message: cabinetState.message,
                code: cabinetState.code,
              ));
            } else {
              print('cabinetCubit unexpected state ; $cabinetState');
              throw UnexpectedException(
                code: 'cabinet_cubit_exception',
                message: 'what the hej happened',
              );
            }

            print('execGetAllList completed');
          },
        );
      } else if (authState is AuthError) {
        print('AuthCubit Error');
        emit(
          ListScreenState.error(
              message: authState.message,
              code: authState.code ?? 'No code was provided'),
        );
      } else {
        print('authCubit unexpected state ; $authState');
        throw UnexpectedException(code: 'code', message: 'authCubit');
      }
    });
  }
}
