import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storayge/core/auth/auth_cubit/auth_cubit.dart';

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
      event.feedbackOnPressed();

      yield state;
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
