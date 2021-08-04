import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color _kcPrimaryColor = Color(0xffFF916E);
const Color _kcPrimaryColorDarker = Color(0xff8c6051);
const Color _kcSecondaryColor = Color(0xff271700);
const Color _kcTertiaryColor = Color(0xffFFE2BC);
const Color _kcFourthColor = Color(0xffFFF0DC);

const Color _kcGreen = Color(0xffB0FF7D);
const Color _kcWhite = Color(0xffFFFFFF);
const Color _kcWhitePoint5 = Color(0x7fFFFFFF);
const Color _kcBlack = Color(0xff000000);
const Color _kcGrey = Color(0xff707070);

const Color _kcBackgroundColorDark = Color(0xff110A00);
const Color _kcBackgroundColorLight = Color(0xffFFE2BC);

// Public Colors
//
// These colors should strictly be used in occasions that does not allow or is difficult
// to use theme colors.
const Color kcBackgroundColorDark = Color(0xff110A00);
const Color kcSuccessGreenBackground = Color(0xffF2FFDC);
const Color kcSuccessGreenText = Color(0xff102700);
const Color kcErrorRedBackground = Color(0xffFFBBBB);
const Color kcErrorRedText = Color(0xff670000);

double _kPrimaryHeadingTextSize = 40.0.sp;
double _kSecondaryHeadingTextSize = 30.0.sp;
double _kTertiaryHeadingTextSize = 20.0.sp;
double _kParagraphTextSize = 16.0.sp;

ThemeData appTheme(BuildContext context) => Theme.of(context);
TextTheme appTextTheme(BuildContext context) => Theme.of(context).textTheme;
TextStyle appBodyText1(BuildContext context) =>
    Theme.of(context).textTheme.bodyText1!;
TextStyle appHeadline3(BuildContext context) =>
    Theme.of(context).textTheme.headline3!;

mixin AppTheme {
  static Color get kcBackgroundColorDark => _kcBackgroundColorDark;

  static ThemeData get darkTheme {
    return ThemeData(
      /// [Colors]
      primaryColor: _kcPrimaryColor,
      indicatorColor: _kcTertiaryColor,
      accentColor: _kcTertiaryColor,

      /// These two colors are meant for (but not exclusively) [InfoBar]
      dialogBackgroundColor: _kcFourthColor,
      dividerColor: _kcTertiaryColor,

      shadowColor: _kcBlack,
      hintColor: _kcWhite,
      focusColor: _kcPrimaryColor,
      highlightColor: _kcWhite,
      scaffoldBackgroundColor: _kcBackgroundColorDark,
      backgroundColor: _kcBackgroundColorDark,

      /// [Fonts and TextTheme]
      textTheme: TextTheme(
        headline1: TextThemeDark.headline1,
        headline2: TextThemeDark.headline2,
        headline3: TextThemeDark.headline3,
        headline4: TextThemeDark.headline4,
        headline5: TextThemeDark.headline5,
        headline6: TextThemeDark.headline6,
        bodyText1: TextThemeDark.bodyText1,
        bodyText2: TextThemeDark.bodyText2,
        caption: TextThemeDark.caption,
      ),
      fontFamily: 'Montserrat',

      /// [Icons]
      iconTheme: const IconThemeData(color: _kcWhite),

      /// [Buttons]
      buttonTheme: ButtonThemeData(
        disabledColor: _kcPrimaryColor,
        padding: EdgeInsets.zero,
        buttonColor: _kcPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onSurface: _kcWhite,
          padding: EdgeInsets.zero,
          primary: _kcPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      /// [Colors]
      primaryColor: _kcPrimaryColor,
      indicatorColor: _kcBackgroundColorDark,
      accentColor: _kcBackgroundColorDark,

      /// These two colors are meant for (but not exclusively) [InfoBar]
      dialogBackgroundColor: _kcFourthColor, // Card Color
      dividerColor: _kcBackgroundColorDark, // Border Card Color

      hintColor: _kcBackgroundColorDark,
      shadowColor: _kcTertiaryColor,
      focusColor: _kcPrimaryColor,
      highlightColor: _kcWhite,
      scaffoldBackgroundColor: _kcBackgroundColorLight,
      backgroundColor: _kcBackgroundColorLight,

      /// [Font and TextTheme]
      textTheme: TextTheme(
        headline1: TextThemeLight.headline1,
        headline2: TextThemeLight.headline2,
        headline3: TextThemeLight.headline3,
        headline4: TextThemeLight.headline4,
        headline5: TextThemeLight.headline5,
        headline6: TextThemeLight.headline6,
        bodyText1: TextThemeLight.bodyText1,
        bodyText2: TextThemeLight.bodyText2,
        caption: TextThemeLight.caption,
      ),
      fontFamily: 'Montserrat',

      /// [Icons]
      iconTheme: const IconThemeData(color: _kcBlack),

      /// [Buttons]
      buttonTheme: ButtonThemeData(
        disabledColor: _kcPrimaryColorDarker,
        padding: EdgeInsets.zero,
        buttonColor: _kcPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onSurface: _kcPrimaryColorDarker,
          padding: EdgeInsets.zero,
          primary: _kcPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}

mixin TextThemeLight {
  /// [TextThemeLight] equivalence to the Storayge design system.
  ///
  /// [PrimaryHeading] == [headline1]
  /// [SecondaryHeading] == [headline2]
  /// [HeadingParagraph] == [headline3]
  /// [HeadingParagraph - Inverted Colors] == [headline4]
  /// [HeadingParagraph - Dark for lightTheme and darkTheme] == [headline5]
  /// [Paragraph] == [bodyText1]
  /// [Paragraph - Inverted Colors] == [bodyText2]
  /// [ButtonText] == [bodyText3]
  /// [Subtitle] == [caption]
  ///
  ///
  static TextStyle get headline1 {
    return TextStyle(
      color: _kcTertiaryColor,
      fontSize: _kPrimaryHeadingTextSize,
      fontFamily: 'Montserrat_Alt',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get headline2 {
    return TextStyle(
      color: _kcBackgroundColorDark,
      fontSize: _kSecondaryHeadingTextSize,
      fontFamily: 'Montserrat_Alt',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get headline3 {
    return TextStyle(
      color: _kcBackgroundColorDark,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get headline4 {
    return TextStyle(
      color: _kcWhite,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get headline5 {
    return TextStyle(
      color: _kcBackgroundColorDark,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get headline6 {
    return TextStyle(
      color: _kcWhite,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get bodyText1 {
    return TextStyle(
      color: _kcBackgroundColorDark,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle get bodyText2 {
    return TextStyle(
      color: _kcWhite,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle get caption {
    return TextStyle(
      color: _kcBackgroundColorDark.withOpacity(0.5),
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.normal,
    );
  }
}

mixin TextThemeDark {
  /// [TextThemeDark] equivalence to the Storayge design system.
  ///
  /// [PrimaryHeading] == [headline1]
  /// [SecondaryHeading] == [headline2]
  /// [HeadingParagraph] == [headline3]
  /// [HeadingParagraph - Inverted Colors] == [headline4]
  /// [HeadingParagraph - Dark for lightTheme and darkTheme] == [headline5]
  /// [Paragraph] == [bodyText1]
  /// [Paragraph - Inverted Colors] == [bodyText2]
  /// [Subtitle] == [caption]
  ///
  ///
  static TextStyle get headline1 {
    return TextStyle(
      color: _kcTertiaryColor,
      fontSize: _kPrimaryHeadingTextSize,
      fontFamily: 'Montserrat_Alt',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle get headline2 {
    return TextStyle(
      color: _kcWhite,
      fontSize: _kSecondaryHeadingTextSize,
      fontFamily: 'Montserrat_Alt',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get headline3 {
    return TextStyle(
      color: _kcWhite,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get headline4 {
    return TextStyle(
      color: _kcBackgroundColorDark,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get headline5 {
    return TextStyle(
      color: _kcBackgroundColorDark,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle get headline6 {
    return TextStyle(
      color: _kcBackgroundColorDark,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle get bodyText1 {
    return TextStyle(
      color: _kcWhite,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle get bodyText2 {
    return TextStyle(
      color: _kcBackgroundColorDark,
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle get caption {
    return TextStyle(
      color: _kcWhite.withOpacity(0.5),
      fontSize: _kParagraphTextSize,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.normal,
    );
  }
}
