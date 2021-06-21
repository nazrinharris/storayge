part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterViewFirstPageRequested extends RegisterEvent {}

class RegisterViewSecondPageRequested extends RegisterEvent {}
