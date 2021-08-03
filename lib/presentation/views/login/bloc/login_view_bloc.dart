import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_view_event.dart';
part 'login_view_state.dart';
part 'login_view_bloc.freezed.dart';

class LoginViewBloc extends Bloc<LoginViewEvent, LoginViewState> {
  LoginViewBloc() : super(_Initial());

  @override
  Stream<LoginViewState> mapEventToState(
    LoginViewEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
