part of 'register_view_cubit.dart';

abstract class RegisterViewState extends Equatable {
  final String usernameValue;
  final String emailValue;
  final String passwordValue;
  final String confirmPasswordValue;

  const RegisterViewState({
    required this.emailValue,
    required this.passwordValue,
    required this.confirmPasswordValue,
    required this.usernameValue,
  });

  @override
  List<Object> get props => [];
}

class RegisterViewFirstPage extends RegisterViewState {
  final String usernameValue;
  final String emailValue;
  final String passwordValue;
  final String confirmPasswordValue;

  const RegisterViewFirstPage({
    required this.emailValue,
    required this.passwordValue,
    required this.confirmPasswordValue,
    required this.usernameValue,
  }) : super(
          usernameValue: usernameValue,
          emailValue: emailValue,
          passwordValue: passwordValue,
          confirmPasswordValue: confirmPasswordValue,
        );

  @override
  List<Object> get props => [
        usernameValue,
        emailValue,
        passwordValue,
        confirmPasswordValue,
      ];
}

class RegisterViewSecondPage extends RegisterViewState {
  const RegisterViewSecondPage() : super();
}
