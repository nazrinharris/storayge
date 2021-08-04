import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storayge/core/util/storayge_icons.dart';
import 'package:storayge/presentation/shared/local_theme.dart';

import '../../presentation/shared/styles.dart';
import '../../presentation/shared/ui_helpers.dart';

class PrimaryButton extends StatelessWidget {
  final String? content;
  final Widget child;
  final double? width;
  final Function()? onPressed;
  final Icon? buttonIcon;
  final double? horizontalPadding;
  final double? verticalPadding;

  const PrimaryButton({
    Key? key,
    this.content,
    required this.child,
    this.onPressed,
    this.buttonIcon,
    this.width,
    this.horizontalPadding,
    this.verticalPadding,
  }) : super(key: key);

  Widget _resolveChild(BuildContext context) {
    if (buttonIcon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          horizontalSpace14,
          buttonIcon!,
        ],
      );
    } else {
      return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? 14,
          horizontal: horizontalPadding ?? 34,
        ),
        alignment: Alignment.center,
        width: width,
        child: _resolveChild(context),
      ),
    );
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
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          child: Text(
            content,
            style: appTextTheme(context).bodyText2,
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
          overlayColor: MaterialStateProperty.all(
              Theme.of(context).highlightColor.withOpacity(0.25)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: 46,
          child: Text(
            content,
            style: appTextTheme(context).bodyText1,
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
        style: appTextTheme(context).caption!.copyWith(
              decoration: TextDecoration.underline,
              color: Colors.white,
            ),
      ),
    );
  }
}

class ThirdPartySignUpButton extends StatelessWidget {
  final Function()? onPressed;
  final String content;
  final double width;

  const ThirdPartySignUpButton({
    Key? key,
    required this.content,
    required this.onPressed,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          overlayColor: MaterialStateProperty.all(
              const Color(0xff707070).withOpacity(0.5)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)))),
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        height: 36,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              StoraygeIcons.google,
              color: Colors.blue,
              size: 16,
            ),
            horizontalSpace10,
            Text(
              content,
              style: appTextTheme(context).bodyText1!.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff707070),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
