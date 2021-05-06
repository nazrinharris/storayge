import 'package:flutter/material.dart';

import '../../presentation/shared/local_buttons.dart';
import '../../presentation/shared/styles.dart';
import '../../presentation/shared/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final bool showTermsText;
  final bool showForgotPasswordText;
  final Function()? onMainButtonTapped;
  final Function()? onCreateAccountTapped;
  final Function()? onForgotPassword;
  final Function()? onBackPressed;
  final Function()? onLoginPressed;
  final String? validationMessage;

  const AuthenticationLayout({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.mainButtonTitle,
    required this.form,
    required this.showTermsText,
    required this.showForgotPasswordText,
    this.onLoginPressed,
    this.onMainButtonTapped,
    this.onCreateAccountTapped,
    this.onForgotPassword,
    this.onBackPressed,
    this.validationMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceRegular,
          if (onBackPressed != null)
            Row(children: [
              IconButton(
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft,
                icon: const Icon(Icons.arrow_back, color: kcWhite),
                onPressed: onBackPressed,
              ),
            ]),
          if (onBackPressed != null) verticalSpaceSmall,
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: screenWidthPercentage(context, percentage: 0.6),
              child: Text(
                title,
                style: ktsSecondaryHeading,
              ),
            ),
          ),
          verticalSpaceSmall,
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: screenWidthPercentage(context, percentage: 0.5),
              child: Text(
                subtitle,
                style: ktsSubtitle,
              ),
            ),
          ),
          verticalSpaceRegular,
          form,
          verticalSpaceRegular,
          if (onForgotPassword != null)
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onForgotPassword,
                child: Text(
                  'Forgot your password? Click here',
                  style: ktsParagraph.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          verticalSpaceRegular,
          if (validationMessage != null)
            Text(
              validationMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: kParagraphTextSize,
              ),
            ),
          if (validationMessage != null) verticalSpaceRegular,
          InkWell(
            borderRadius: BorderRadius.circular(16.0),
            onTap: onMainButtonTapped,
            child: Ink(
              width: double.infinity,
              height: 50.0,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Align(
                child: Text(
                  mainButtonTitle,
                  style: ktsButtonText,
                ),
              ),
            ),
          ),
          verticalSpaceRegular,
          if (onCreateAccountTapped != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: ktsSubtitle,
                ),
                horizontalSpaceTiny,
                PressableText(
                  content: 'Create an account',
                  onTap: onCreateAccountTapped,
                ),
              ],
            ),
          if (onCreateAccountTapped != null) verticalSpaceSmall,
          if (showTermsText)
            Column(
              children: [
                Text(
                  'By signing up you agree to our terms, conditions and privacy policy',
                  style: ktsSubtitle,
                  textAlign: TextAlign.center,
                ),
                verticalSpaceRegular,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account? ',
                      style: ktsSubtitle,
                    ),
                    PressableText(content: 'Login here', onTap: onLoginPressed),
                  ],
                ),
                verticalSpaceMedium,
              ],
            ),
          if (showForgotPasswordText)
            Align(
              child: PressableText(
                  content: 'Forgot your password? Click here',
                  onTap: onForgotPassword),
            ),
        ],
      ),
    );
  }
}
