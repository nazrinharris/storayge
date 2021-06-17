part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthIdle extends AuthState {}

class AuthLoading extends AuthState {
  final String currentOperationMessage;

  const AuthLoading({required this.currentOperationMessage});
}

class AuthLoaded extends AuthState {
  final StoraygeUser storaygeUser;

  const AuthLoaded({
    required this.storaygeUser,
  });

  @override
  List<Object> get props => [storaygeUser];
}

class AuthGeneralCompleted extends AuthState {
  final dynamic content;

  const AuthGeneralCompleted({required this.content});
}

class AuthLoggedIn extends AuthState {
  final StoraygeUser storaygeUser;

  const AuthLoggedIn({required this.storaygeUser});
}

class AuthNotLoggedIn extends AuthState {}

/// [ErrorStates]
///
///
class AuthError extends AuthState {
  final String message;
  final String? code;

  const AuthError({
    required this.message,
    this.code,
  });

  @override
  List<Object> get props => [message];
}

class AuthErrorNotSamePassword extends AuthState {
  final String message;
  final String code;

  const AuthErrorNotSamePassword({
    required this.message,
    required this.code,
  });

  @override
  List<Object> get props => [message, code];
}
