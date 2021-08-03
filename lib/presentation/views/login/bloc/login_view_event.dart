part of 'login_view_bloc.dart';

@freezed
class LoginViewEvent with _$LoginViewEvent {
  const factory LoginViewEvent.started() = _Started;
}