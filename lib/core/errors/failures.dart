import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List<Object> properties;

  const Failure({required this.properties});

  @override
  List<Object> get props => properties;
}

// General Failures
class FirestoreFailure extends Failure {
  final String message;

  FirestoreFailure(this.message) : super(properties: [message]);
}

class CacheFailure extends Failure {
  CacheFailure() : super(properties: []);
}
