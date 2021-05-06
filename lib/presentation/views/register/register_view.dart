import 'package:flutter/material.dart';
import '../../../presentation/dumb_widgets/authentication_layout.dart';
import '../../../presentation/shared/styles.dart';
import '../../../presentation/shared/ui_helpers.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: AuthenticationLayout(
          onBackPressed: () {},
          onLoginPressed: () {},
          validationMessage: '',
          onMainButtonTapped: () {},
          title: 'Welcome to Storayge!',
          subtitle: "Let's create your account to get you started!",
          mainButtonTitle: 'Register',
          form: Column(
            children: [
              TextField(
                style: ktsParagraph,
                decoration: InputDecoration(
                    focusColor: kcWhite,
                    labelText: 'Username',
                    labelStyle: ktsHeadingParagraph,
                    hintText: 'Enter your desired username',
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
                    labelText: 'Password',
                    labelStyle: ktsHeadingParagraph,
                    hintText: 'Enter a secure password',
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
                    labelText: 'Confirm password',
                    labelStyle: ktsHeadingParagraph,
                    hintText: 'Make sure to enter the exact same password',
                    hintStyle: ktsSubtitle,
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kcWhitePoint5),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(width: 2, color: kcPrimaryColor),
                    )),
              ),
            ],
          ),
          showTermsText: true,
          showForgotPasswordText: false,
        ),
      ),
    );
  }
}
