import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      backgroundColor: kcBackgroundColor,
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Storayge', style: ktsPrimaryHeading),
                    horizontalSpaceSmall,
                    logoWidget,
                  ],
                ),
                verticalSpaceRegular,
                const Text(
                  'Manage your storage. Whether in the \nkitchen, bedroom or warehouse',
                  style: ktsParagraph,
                  textAlign: TextAlign.center,
                ),
                customVerticalSpace(height: _heightBetweenSubtitleAndCharacter),
                unboxingCharacterWidget,
                PrimaryButton(
                  content: "Start managing!",
                  onPressed: () {},
                ),
                verticalSpaceRegular,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an account? ',
                      style: ktsSubtitle,
                    ),
                    PressableText(content: 'Login here', onTap: () {})
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
