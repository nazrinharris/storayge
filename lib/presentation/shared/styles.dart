import 'package:flutter/material.dart';

//colors
const Color kcPrimaryColor = Color(0xffFF916E);
const Color kcSecondaryColor = Color(0xff271700);
const Color kcTertiaryColor = Color(0xffFFE2BC);

const Color kcGreen = Color(0xffB0FF7D);
const Color kcWhite = Color(0xffFFFFFF);
const Color kcWhitePoint5 = Color(0x7fFFFFFF);
const Color kcBlack = Color(0xff000000);
const Color kcBackgroundColor = Color(0xff110A00);

// TextStyle
const TextStyle ktsPrimaryHeading = TextStyle(
  color: kcTertiaryColor,
  fontSize: kPrimaryHeadingTextSize,
  fontFamily: 'Montserrat_Alt',
  fontWeight: FontWeight.w700,
);
const TextStyle ktsSecondaryHeading = TextStyle(
  color: kcWhite,
  fontSize: kSecondaryHeadingTextSize,
  fontFamily: 'Montserrat_Alt',
  fontWeight: FontWeight.w600,
);
const TextStyle ktsSecondaryHeading_1 = TextStyle(
  color: kcWhite,
  fontSize: kSecondaryHeadingTextSize,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
);
const TextStyle ktsTertiaryHeading = TextStyle(
  color: kcWhite,
  fontSize: kPrimaryHeadingTextSize,
  fontFamily: 'Montserrat_Alt',
  fontWeight: FontWeight.w700,
);
const TextStyle ktsHeadingParagraph = TextStyle(
  color: kcWhite,
  fontSize: kParagraphTextSize,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w600,
);
const TextStyle ktsParagraph = TextStyle(
  color: kcWhite,
  fontSize: kParagraphTextSize,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.normal,
);
TextStyle ktsSubtitle = TextStyle(
  color: kcWhite.withOpacity(0.5),
  fontSize: kParagraphTextSize,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.normal,
);
TextStyle ktsSubtitle_1 = TextStyle(
  color: kcWhite.withOpacity(0.5),
  fontSize: kPrimaryHeadingTextSize,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.normal,
  fontStyle: FontStyle.italic,
);
TextStyle ktsButtonText = const TextStyle(
  color: kcBlack,
  fontSize: kParagraphTextSize,
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.normal,
);

// Font Sizes
const double kPrimaryHeadingTextSize = 40.0;
const double kSecondaryHeadingTextSize = 30.0;
const double kTertiaryHeadingTextSize = 20.0;
const double kParagraphTextSize = 14.0;

InputDecoration kInputDecoration({
  required String labelText,
  required String hintText,
}) =>
    InputDecoration(
        focusColor: kcWhite,
        labelText: labelText,
        labelStyle: ktsHeadingParagraph,
        hintText: hintText,
        hintStyle: ktsSubtitle,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kcWhitePoint5),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 2, color: kcPrimaryColor),
        ));
