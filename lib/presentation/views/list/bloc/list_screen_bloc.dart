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
    required this.cabinetCubit,
    required this.authCubit,
  }) : super(const LSInitial());

  @override
  Stream<ListScreenState> mapEventToState(
    ListScreenEvent event,
  ) async* {
    yield* event.map(
      started: (event) async* {
        // yield const ListScreenState.loading(
        //     currentOperationMessage: 'Retrieving your groups');

        // String uid;

        // AuthState authState = authCubit.state;
        // CabinetState cabinetState = cabinetCubit.state;

        // print("started");

        // await authCubit.execGetUserUid().then((_) async* {
        //   print("UID Retrieved");
        //   if (authState is AuthGeneralCompleted) {
        //     uid = authState.content;

        //     await cabinetCubit.execGetAllList(uid: uid).then((_) async* {
        //       if (cabinetState is CabinetLoadedGetAllListSGSnip) {
        //         yield ListScreenState.loadedAllListSGSnip(
        //             cabinetState.allListSGSnip);
        //       } else if (cabinetState is CabinetErrorGetAllListSGSnip) {
        //         yield ListScreenState.error(
        //           message: cabinetState.message,
        //           code: cabinetState.code,
        //         );
        //       } else {
        //         //todo: library of codes and exceptions and messages
        //         throw UnexpectedException(
        //           code: "cabinet_cubit_exception",
        //           message: "hmmmm",
        //         );
        //       }
        //     });
        //   } else if (authState is AuthError) {
        //     yield ListScreenState.error(
        //       message: authState.message,
        //       code: authState.code ?? 'No code was provided',
        //     );
        //   } else {
        //     //todo: library of codes and exceptions and messages
        //     throw UnexpectedException(
        //       code: "auth_cubit_exception",
        //       message: "hmmmm",
        //     );
        //   }
        // });
      },
      execGetAllListSGSnip: (LSexecGetAllListSGSnip event) async* {
        yield const ListScreenState.loading(
            currentOperationMessage: 'Retrieving your groups');

        String uid;

        AuthState authState = authCubit.state;
        CabinetState cabinetState = cabinetCubit.state;

        print("execGetAllListSGSnip");

        await authCubit.execGetUserUid().then((_) {
          print("execGetUserUid");
        });

        await authCubit.execGetUserUid().then((_) async* {
          print("UID Retrieved");
          if (authState is AuthGeneralCompleted) {
            uid = authState.content;

            await cabinetCubit.execGetAllList(uid: uid).then((_) async* {
              if (cabinetState is CabinetLoadedGetAllListSGSnip) {
                yield ListScreenState.loadedAllListSGSnip(
                    cabinetState.allListSGSnip);
              } else if (cabinetState is CabinetErrorGetAllListSGSnip) {
                yield ListScreenState.error(
                  message: cabinetState.message,
                  code: cabinetState.code,
                );
              } else {
                //todo: library of codes and exceptions and messages
                throw UnexpectedException(
                  code: "cabinet_cubit_exception",
                  message: "hmmmm",
                );
              }
            });
          } else if (authState is AuthError) {
            yield ListScreenState.error(
              message: authState.message,
              code: authState.code ?? 'No code was provided',
            );
          } else {
            //todo: library of codes and exceptions and messages
            throw UnexpectedException(
              code: "auth_cubit_exception",
              message: "hmmmm",
            );
          }
        });
      },
    );
  }

  @override
  void onChange(Change<ListScreenState> change) {
    print(change);
    super.onChange(change);
  }
}
