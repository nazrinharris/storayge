import 'package:flutter/material.dart';

import '../../../presentation/dumb_widgets/authentication_layout.dart';
import '../../../presentation/shared/styles.dart';
import '../../../presentation/shared/ui_helpers.dart';
import '../../shared/local_appbar.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kcBackgroundColor,
      appBar: defaultAppBar(hasBackButton: true, context: context),
      body: AuthenticationLayout(
        onLoginPressed: () {
          Navigator.of(context).pushReplacementNamed('/login');
        },
        validationMessage: '',
        onMainButtonTapped: () {},
        title: 'Welcome to Storayge!',
        subtitle: "Let's create your account to get you started!",
        mainButtonTitle: 'Register',
        form: const RegisterForm(),
        showTermsText: true,
        showForgotPasswordText: false,
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _globalFormKey = GlobalKey<_RegisterFormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalFormKey,
      child: Column(
        children: [
          TextFormField(
              style: ktsParagraph,
              decoration: kInputDecoration(
                labelText: 'Username',
                hintText: 'Enter your desired username',
              )),
          verticalSpaceSmall,
          TextFormField(
              style: ktsParagraph,
              decoration: kInputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
              )),
          verticalSpaceSmall,
          TextFormField(
              obscureText: true,
              style: ktsParagraph,
              decoration: kInputDecoration(
                labelText: 'Password',
                hintText: 'Enter your secure password',
              )),
          verticalSpaceSmall,
          TextFormField(
              obscureText: true,
              style: ktsParagraph,
              decoration: kInputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Make sure to enter the exact same password',
              )),
        ],
      ),
    );
  }
}
