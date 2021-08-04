part of 'login_view_bloc.dart';

@freezed
class LoginViewState with _$LoginViewState {
  const factory LoginViewState.initial(LoginViewProps loginViewProps) =
      _LVSInitial;
  const factory LoginViewState.loading(LoginViewProps loginViewProps) =
      _LVSLoading;
  const factory LoginViewState.idle(LoginViewProps loginViewProps) = _LVSIdle;
}

@freezed
class LoginViewProps with _$LoginViewProps {
  const factory LoginViewProps({
    required bool isInfoTileVisible,
  }) = _LoginViewProps;
}
