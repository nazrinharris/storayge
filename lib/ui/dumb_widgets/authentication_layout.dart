import 'package:flutter/material.dart';
import 'package:storayge/ui/shared/styles.dart';
import 'package:storayge/ui/shared/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final bool showTermsText;
  final Function()? onMainButtonTapped;
  final Function()? onCreateAccountTapped;
  final Function()? onForgotPassword;
  final Function()? onBackPressed;
  final String? validationMessage;
  final bool busy;

  const AuthenticationLayout({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.mainButtonTitle,
    required this.form,
    required this.showTermsText,
    this.onMainButtonTapped,
    this.onCreateAccountTapped,
    this.onForgotPassword,
    this.onBackPressed,
    this.validationMessage,
    required this.busy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          if (onBackPressed == null) verticalSpaceLarge,
          if (onBackPressed != null) verticalSpaceRegular,
          if (onBackPressed != null)
            IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              icon: Icon(Icons.arrow_back),
              onPressed: onBackPressed,
            ),
          Text(
            title,
            style: TextStyle(fontSize: 34),
          ),
          verticalSpaceSmall,
          SizedBox(
            width: screenWidthPercentage(context, percentage: 0.7),
            child: Text(
              subtitle,
              style: ktsSubtitle,
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
              style: TextStyle(
                color: Colors.red,
                fontSize: kParagraphTextSize,
              ),
            ),
          if (validationMessage != null) verticalSpaceRegular,
          GestureDetector(
            onTap: onMainButtonTapped,
            child: Container(
              width: double.infinity,
              height: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: busy
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white))
                  : Text(
                      mainButtonTitle,
                      style: ktsParagraph,
                    ),
            ),
          ),
          verticalSpaceRegular,
          if (onCreateAccountTapped != null)
            GestureDetector(
              onTap: onCreateAccountTapped,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  horizontalSpaceTiny,
                  Text(
                    'Create an account',
                    style: TextStyle(
                      color: kcPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          if (showTermsText)
            Text(
              'By signing up you agree to our terms, conditions and privacy policy',
              style: ktsSubtitle,
              textAlign: TextAlign.center,
            )
        ],
      ),
    );
  }
}
