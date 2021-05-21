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
