part of 'register_view_cubit.dart';

abstract class RegisterViewState extends Equatable {
  const RegisterViewState();

  @override
  List<Object> get props => [];
}

class RegisterViewFirstPage extends RegisterViewState {
  final String? usernameValue;
  final String? emailValue;

  const RegisterViewFirstPage({
    required this.emailValue,
    required this.usernameValue,
  });

  @override
  List<Object> get props => [
        usernameValue ?? '',
        emailValue ?? '',
      ];
}

class RegisterViewSecondPage extends RegisterViewState {
  final String? passwordValue;
  final String? confirmPasswordValue;

  const RegisterViewSecondPage({
    required this.passwordValue,
    required this.confirmPasswordValue,
  });

  @override
  List<Object> get props => [
        passwordValue ?? '',
        confirmPasswordValue ?? '',
      ];
}
