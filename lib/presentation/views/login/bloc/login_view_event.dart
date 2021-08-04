part of 'login_view_bloc.dart';

@freezed
class LoginViewEvent with _$LoginViewEvent {
  const factory LoginViewEvent.started() = _LVEStarted;
  const factory LoginViewEvent.idle() = _LVEIdle;
  const factory LoginViewEvent.continuePressed({
    required Function() showInfoTile,
    required Function() hideInfoTile,
    required Function() doAfterSuccess,
    required Function() doAfterError,
    required Function(InfoTileProps infoTileProps) updateInfoTile,
    required Function() triggerLoadingPrimaryButtonAware,
    required Function() triggerFirstPrimaryButtonAware,
    required String email,
    required String password,
  }) = _LVEContinuePressed;
  const factory LoginViewEvent.toggleInfoTileVisibility() = _LVEToggleVisible;
}
