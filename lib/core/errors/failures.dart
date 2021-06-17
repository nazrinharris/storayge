import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? code;
  final String? message;

  const Failure({this.code, this.message});

  @override
  List<Object> get props {
    return [
      code ?? 'UNKNOWN CODE',
      message ?? 'Unknown message for this failure',
    ];
  }
}

// General Failures
class FirestoreFailure extends Failure {
  const FirestoreFailure({
    String? code,
    String? message,
  }) : super(
          code: code,
          message: message,
        );
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure({
    String? code,
    String? message,
  }) : super(
          code: code,
          message: message,
        );
}

class ServerFailure extends Failure {
  const ServerFailure({
    String? code,
    String? message,
  }) : super(
          code: code,
          message: message,
        );
}

class StorageFailure extends Failure {
  const StorageFailure({
    String? code,
    String? message,
  }) : super(
          code: code,
          message: message,
        );
}

class UserFailure extends Failure {
  const UserFailure({
    String? code,
    String? message,
  }) : super(
          code: code,
          message: message,
        );
}

class UserNotFoundFailure extends Failure {}

class CacheFailure extends Failure {
  const CacheFailure() : super();
}
