import 'package:flutter/material.dart';
import '../../../presentation/dumb_widgets/authentication_layout.dart';
import '../../../presentation/shared/styles.dart';
import '../../../presentation/shared/ui_helpers.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: AuthenticationLayout(
          onBackPressed: () {},
          validationMessage: '',
          onMainButtonTapped: () {},
          onCreateAccountTapped: () {},
          title: 'Good to see you here!',
          subtitle: "Let's get you up and running real quick",
          mainButtonTitle: 'Login',
          form: Column(
            children: [
              TextField(
                style: ktsParagraph,
                decoration: InputDecoration(
                    focusColor: kcWhite,
                    labelText: 'Email',
                    labelStyle: ktsHeadingParagraph,
                    hintText: 'Enter your email',
                    hintStyle: ktsSubtitle,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kcWhitePoint5),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: kcPrimaryColor),
                    )),
              ),
              verticalSpaceSmall,
              TextField(
                obscureText: true,
                style: ktsParagraph,
                decoration: InputDecoration(
                    focusColor: kcWhite,
                    labelText: 'Password',
                    labelStyle: ktsHeadingParagraph,
                    hintText: 'Enter your password',
                    hintStyle: ktsSubtitle,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kcWhitePoint5),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: kcPrimaryColor),
                    )),
              ),
              verticalSpaceSmall,
            ],
          ),
          showTermsText: false,
          showForgotPasswordText: true,
        ),
      ),
    );
  }
}
