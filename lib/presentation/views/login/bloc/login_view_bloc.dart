import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';
import 'package:storayge/presentation/smart_widgets/info_tile/bloc/info_tile_bloc.dart';
import 'package:storayge/presentation/smart_widgets/info_tile/info_tile.dart';

part 'login_view_event.dart';
part 'login_view_state.dart';
part 'login_view_bloc.freezed.dart';

class LoginViewBloc extends Bloc<LoginViewEvent, LoginViewState> {
  final LoginViewProps loginViewProps;
  final AuthCubit authCubit;

  LoginViewBloc({
    required this.loginViewProps,
    required this.authCubit,
  }) : super(_LVSInitial(loginViewProps));

  @override
  Stream<LoginViewState> mapEventToState(
    LoginViewEvent event,
  ) async* {
    yield* event.map(started: (_LVEStarted event) async* {
      yield state;
    }, continuePressed: (_LVEContinuePressed event) async* {
      event.updateInfoTile(const InfoTileProps(
        leadingText: "Give us a moment...",
        child: Text("We're logging you in. Sit tight."),
        isAbleToExpand: true,
        isExpanded: false,
        currentStatus: InfoTileStatus.loading,
      ));
      event.triggerLoadingPrimaryButtonAware();
      event.showInfoTile();

      await authCubit
          .loginWithEmailAndPasswordRun(
        email: event.email,
        password: event.password,
      )
          .then(
        (_) {
          AuthState currentState = authCubit.state;

          if (currentState is AuthLoaded) {
            event.updateInfoTile(
              InfoTileProps(
                leadingText: "Successfull login!",
                isAbleToExpand: true,
                isExpanded: false,
                currentStatus: InfoTileStatus.success,
                child: Column(
                  children: [Text(currentState.storaygeUser.email)],
                ),
              ),
            );
            event.triggerFirstPrimaryButtonAware();
            print('Succesfull Login');
          } else if (currentState is AuthError) {
            event.updateInfoTile(
              InfoTileProps(
                leadingText: currentState.message,
                isAbleToExpand: false,
                isExpanded: false,
                currentStatus: InfoTileStatus.error,
                child: const SizedBox.shrink(),
              ),
            );
            event.triggerFirstPrimaryButtonAware();
          }
        },
      );
    }, idle: (_LVEIdle event) async* {
      yield state;
    }, toggleInfoTileVisibility: (_LVEToggleVisible event) async* {
      bool currentVisibilty = state.loginViewProps.isInfoTileVisible;

      yield state.copyWith(
          loginViewProps: state.loginViewProps.copyWith(
        isInfoTileVisible: !currentVisibilty,
      ));
    });
  }
}
