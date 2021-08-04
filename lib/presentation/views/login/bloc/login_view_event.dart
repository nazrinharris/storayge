part of 'login_view_bloc.dart';

@freezed
class LoginViewEvent with _$LoginViewEvent {
  const factory LoginViewEvent.started() = _LVEStarted;
  const factory LoginViewEvent.idle() = _LVEIdle;
  const factory LoginViewEvent.continuePressed({
    /// [feedbackOnPressed] is a method meant to trigger visual state changes in accordance
    /// to it's state. Basically, this should be a UI-affecting only method.
    required Function() feedbackOnPressed,

    /// [onPressed] is a method meant to communicate with the backend and such.
    required Function() onPressed,
    required Function() onLoading,
  }) = _LVEContinuePressed;
  const factory LoginViewEvent.toggleInfoTileVisibility() = _LVEToggleVisible;
}
