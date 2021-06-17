part of 'cabinet_cubit.dart';

abstract class CabinetState extends Equatable {
  const CabinetState();

  @override
  List<Object> get props => [];
}

class CabinetInitial extends CabinetState {}

class CabinetLoading extends CabinetState {
  final String message;

  const CabinetLoading({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class GetShelfCompleted extends CabinetState {
  final Shelf shelf;

  const GetShelfCompleted({required this.shelf});

  @override
  List<Object> get props => [shelf];
}

class StoreShelfCompleted extends CabinetState {}

/// [ErrorStates]
///
///
class GetShelfError extends CabinetState {
  final String? message;
  final String? code;

  const GetShelfError({
    required this.message,
    required this.code,
  });

  @override
  List<Object> get props => [message ?? '', code ?? ''];
}

class StoreShelfError extends CabinetState {
  final String? message;
  final String? code;

  const StoreShelfError({
    required this.message,
    required this.code,
  });

  @override
  List<Object> get props => [message ?? '', code ?? ''];
}
