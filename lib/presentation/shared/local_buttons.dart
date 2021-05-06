import 'package:flutter/material.dart';

import '../../presentation/shared/styles.dart';
import '../../presentation/shared/ui_helpers.dart';

class PrimaryButton extends StatelessWidget {
  final String content;
  final Function()? onPressed;
  final Icon? buttonIcon;

  const PrimaryButton({
    Key? key,
    required this.content,
    required this.onPressed,
    this.buttonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (buttonIcon == null) {
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
          backgroundColor: MaterialStateProperty.all(kcPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                content,
                style: ktsButtonText,
              ),
              horizontalSpaceSmall,
              buttonIcon!,
            ],
          ),
        ),
      );
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
