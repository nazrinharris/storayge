import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:storayge/presentation/shared/local_theme.dart';

import '../../../presentation/shared/local_buttons.dart';
import '../../../presentation/shared/styles.dart';
import '../../../presentation/shared/ui_helpers.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String iconPath = 'assets/images/svg/storayge_icon.svg';
    const String unboxingCharacterPath =
        'assets/images/svg/character_unboxing.svg';
    final Widget iconWidget = SvgPicture.asset(
      iconPath,
      height: 170,
      width: 170,
    );
    final Widget unboxingCharacterWidget = SvgPicture.asset(
      unboxingCharacterPath,
      width: 1.5.sw,
    );
    final _heightBetweenSubtitleAndCharacter =
        screenHeightPercentage(context, percentage: 0.08);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 1.sh,
            width: 1.sw,
            child: unboxingCharacterWidget,
          ),
          Container(
            height: 1.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Theme.of(context).backgroundColor.withOpacity(0.8),
                  Theme.of(context).backgroundColor,
                ],
              ),
            ),
          ),
          Container(
            height: 1.sh,
            width: 1.sw,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'storayge',
                        style: appTextTheme(context)
                            .headline1!
                            .copyWith(fontSize: 58.sp),
                      ),
                      verticalSpace14,
                      Text(
                        'Manage your items. Whether in the \nkitchen, bedroom or warehouse.',
                        style: appBodyText1(context),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: iconWidget,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        onPressed: () {},
                        width: 0.53.sw,
                        verticalPadding: 18,
                        child: Text(
                          'Start Managing!',
                          style: appTextTheme(context).headline6,
                        ),
                      ),
                      verticalSpace24,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: appTextTheme(context).caption,
                          ),
                          PressableText(
                            content: 'Login here',
                            onTap: () {},
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
