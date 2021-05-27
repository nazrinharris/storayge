part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthIdle extends AuthState {}

class AuthLoading extends AuthState {}

class AuthGetStoraygeUser extends AuthState {}

class AuthGetStoraygeUserCompleted extends AuthState {
  final StoraygeUser storaygeUser;

  const AuthGetStoraygeUserCompleted({
    required this.storaygeUser,
  });

  @override
  List<Object> get props => [storaygeUser];
}

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
