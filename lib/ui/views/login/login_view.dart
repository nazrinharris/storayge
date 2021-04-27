import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:storayge/ui/dumb_widgets/authentication_layout.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: AuthenticationLayout(
            busy: model.isBusy,
            onCreateAccountTapped: () {},
            title: 'Welcome',
            subtitle:
                'Enter your email address to sign in. Start managing efficiently!',
            mainButtonTitle: 'Login',
            form: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
              ],
            ),
            onForgotPassword: () {},
            showTermsText: false,
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
