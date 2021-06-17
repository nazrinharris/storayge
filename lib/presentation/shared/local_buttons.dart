import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation/shared/styles.dart';
import '../../presentation/shared/ui_helpers.dart';

class PrimaryButton extends StatelessWidget {
  final String content;
  final double? width;
  final Function()? onPressed;
  final Icon? buttonIcon;

  const PrimaryButton({
    Key? key,
    required this.content,
    this.onPressed,
    this.buttonIcon,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (buttonIcon == null && width == null) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kcPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Text(
            content,
            style: ktsButtonText,
          ),
        ),
      );
    } else if (buttonIcon == null) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kcPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            content,
            style: ktsButtonText,
          ),
        ),
      );
    } else if (width == null) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(kcPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Text(
            content,
            style: ktsButtonText,
          ),
        ),
      );
    } else {
      return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.all(kcPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: Container(
          width: width,
          height: 46,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content,
                style: ktsButtonText,
              ),
              horizontalSpace14,
              buttonIcon!,
            ],
          ),
        ),
      );
    }
  }
}

class SecondaryButton extends StatelessWidget {
  final String content;
  final double? width;
  final Icon? icon;
  final Function()? onPressed;

  const SecondaryButton({
    Key? key,
    this.width,
    this.onPressed,
    this.icon,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (width == null && icon == null) {
      return TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: kcPrimaryColor),
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(color: kcPrimaryColor),
          ),
        ),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Text(
            content,
            style: ktsButtonText.copyWith(color: Colors.white),
          ),
        ),
      );
    } else if (width == null) {
      // TODO: Implement button scenario
      throw UnimplementedError();
    } else if (icon == null) {
      return TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          overlayColor: MaterialStateProperty.all(kcWhite.withOpacity(0.25)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: const BorderSide(color: kcPrimaryColor),
            ),
          ),
          side: MaterialStateProperty.all(
            const BorderSide(color: kcPrimaryColor),
          ),
        ),
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: 46,
          child: Text(
            content,
            style: ktsButtonText.copyWith(color: Colors.white),
          ),
        ),
      );
    } else {
      // TODO: Implement button scenario
      throw UnimplementedError();
    }
  }
}

class PressableText extends StatelessWidget {
  final String content;
  final Function()? onTap;

  const PressableText({
    Key? key,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        content,
        style: ktsSubtitle.copyWith(
          color: kcWhite,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class ThirdPartySignUpButton extends StatelessWidget {
  const ThirdPartySignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
