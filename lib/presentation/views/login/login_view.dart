import 'package:flutter/material.dart';

import '../../../presentation/dumb_widgets/authentication_layout.dart';
import '../../../presentation/shared/styles.dart';
import '../../../presentation/shared/ui_helpers.dart';
import '../../shared/local_appbar.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(hasBackButton: true, context: context),
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: AuthenticationLayout(
          validationMessage: '',
          onMainButtonTapped: () {},
          onCreateAccountTapped: () {
            Navigator.of(context).pushReplacementNamed('/register');
          },
          title: 'Good to see you here!',
          subtitle: "Let's get you up and running real quick",
          mainButtonTitle: 'Login',
          form: Form(
            child: Column(
              children: [
                TextField(
                  style: ktsParagraph,
                  decoration: kInputDecoration(
                      labelText: 'Email', hintText: 'Enter your email'),
                ),
                verticalSpaceSmall,
                TextField(
                    obscureText: true,
                    style: ktsParagraph,
                    decoration: kInputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    )),
                verticalSpaceSmall,
              ],
            ),
          ),
          showTermsText: false,
          showForgotPasswordText: true,
        ),
      ),
    );
  }
}
