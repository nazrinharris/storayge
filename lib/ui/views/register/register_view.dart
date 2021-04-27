import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:storayge/ui/dumb_widgets/authentication_layout.dart';

import 'register_viewmodel.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: AuthenticationLayout(
            busy: model.isBusy,
            title: 'Welcome to Storayge!',
            subtitle: 'Let\'s create your account to get you started!',
            mainButtonTitle: 'Register',
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
            showTermsText: true,
          ),
        ),
      ),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}
