import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:storayge/presentation/shared/local_theme.dart';

import '../../../presentation/shared/local_buttons.dart';
import '../../../presentation/shared/styles.dart';
import '../../../presentation/shared/ui_helpers.dart';

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String logoPath = 'assets/images/svg/storayge_logo.svg';
    const String unboxingCharacterPath =
        'assets/images/svg/character_unboxing.svg';
    final Widget logoWidget = SvgPicture.asset(logoPath);
    final Widget unboxingCharacterWidget =
        SvgPicture.asset(unboxingCharacterPath);
    final _heightBetweenSubtitleAndCharacter =
        screenHeightPercentage(context, percentage: 0.08);

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Column(
            children: [
              verticalSpace34,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Storayge', style: appTextTheme(context).headline1),
                  horizontalSpace14,
                  logoWidget,
                ],
              ),
              verticalSpace24,
              Text(
                'Manage your storage. Whether in the \nkitchen, bedroom or warehouse',
                style: appTextTheme(context).bodyText1,
                textAlign: TextAlign.center,
              ),
              customVerticalSpace(height: _heightBetweenSubtitleAndCharacter),
              unboxingCharacterWidget,
              PrimaryButton(
                content: "Start managing!",
                onPressed: () {
                  Navigator.of(context).pushNamed('/register');
                },
              ),
              verticalSpace24,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account? ',
                    style: appTextTheme(context).caption,
                  ),
                  PressableText(
                      content: 'Login here',
                      onTap: () {
                        Navigator.of(context).pushNamed('/login');
                      })
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
