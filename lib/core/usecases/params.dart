import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class UidParams extends Equatable {
  final String uid;

  const UidParams({required this.uid});

  @override
  List<Object?> get props => [uid];
}

class RegisterParams extends Equatable {
  final String email;
  final String password;
  final String username;

  const RegisterParams({
    required this.email,
    required this.password,
    required this.username,
  });

  @override
  List<Object?> get props => [email, password, username];
}

/// [IDParams] will only be used for usecases in which they take only an ID
///
/// Usecases that needs other params should use their own usecase.
class IDParams extends Equatable {
  final String id;

  const IDParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
