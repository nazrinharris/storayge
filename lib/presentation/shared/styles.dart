import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storayge/presentation/shared/local_theme.dart';

//colors
// const Color kcPrimaryColor = Color(0xffFF916E);
// const Color kcPrimaryColorDarker = Color(0xff8c6051);
// const Color kcSecondaryColor = Color(0xff271700);
// const Color kcTertiaryColor = Color(0xffFFE2BC);

// const Color kcGreen = Color(0xffB0FF7D);
// const Color kcWhite = Color(0xffFFFFFF);
// const Color kcWhitePoint5 = Color(0x7fFFFFFF);
// const Color kcBlack = Color(0xff000000);
// const Color kcGrey = Color(0xff707070);
// //const Color kcBackgroundColor = Color(0xff110A00);

// // TextStyle
// // TextStyle ktsPrimaryHeading = TextStyle(
// //   color: kcTertiaryColor,
// //   fontSize: kPrimaryHeadingTextSize,
// //   fontFamily: 'Montserrat_Alt',
// //   fontWeight: FontWeight.w700,
// // );
// // TextStyle ktsSecondaryHeading = TextStyle(
// //   color: kcWhite,
// //   fontSize: kSecondaryHeadingTextSize,
// //   fontFamily: 'Montserrat_Alt',
// //   fontWeight: FontWeight.w600,
// // );
// TextStyle ktsSecondaryHeading_1 = TextStyle(
//   color: kcWhite,
//   fontSize: kSecondaryHeadingTextSize,
//   fontFamily: 'Montserrat',
//   fontWeight: FontWeight.w600,
// );
// TextStyle ktsTertiaryHeading = TextStyle(
//   color: kcWhite,
//   fontSize: kPrimaryHeadingTextSize,
//   fontFamily: 'Montserrat_Alt',
//   fontWeight: FontWeight.w700,
// );
// // TextStyle ktsHeadingParagraph = TextStyle(
// //   color: kcWhite,
// //   fontSize: kParagraphTextSize,
// //   fontFamily: 'Montserrat',
// //   fontWeight: FontWeight.w600,
// // );
// // TextStyle ktsParagraph = TextStyle(
// //   color: kcWhite,
// //   fontSize: kParagraphTextSize,
// //   fontFamily: 'Montserrat',
// //   fontWeight: FontWeight.normal,
// // );
// TextStyle ktsSubtitle = TextStyle(
//   color: kcWhite.withOpacity(0.5),
//   fontSize: kParagraphTextSize,
//   fontFamily: 'Montserrat',
//   fontWeight: FontWeight.normal,
// );
// TextStyle ktsSubtitle_1 = TextStyle(
//   color: kcWhite.withOpacity(0.5),
//   fontSize: kPrimaryHeadingTextSize,
//   fontFamily: 'Montserrat',
//   fontWeight: FontWeight.normal,
//   fontStyle: FontStyle.italic,
// );
// TextStyle ktsButtonText = TextStyle(
//   color: kcBlack,
//   fontSize: kParagraphTextSize,
//   fontFamily: 'Montserrat',
//   fontWeight: FontWeight.w500,
//   fontStyle: FontStyle.normal,
// );

// Font Sizes
// double kPrimaryHeadingTextSize = 40.0.sp;
// double kSecondaryHeadingTextSize = 30.0.sp;
// double kTertiaryHeadingTextSize = 20.0.sp;
// double kParagraphTextSize = 16.0.sp;

InputDecoration kInputDecoration({
  String? labelText,
  required String hintText,
  required BuildContext context,
}) {
  return InputDecoration(
      focusColor: Theme.of(context).focusColor,
      labelText: labelText,
      labelStyle: appTextTheme(context).bodyText1,
      hintText: hintText,
      hintStyle: appTextTheme(context).caption,
      enabledBorder: UnderlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).accentColor.withOpacity(0.5)),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(width: 2, color: Theme.of(context).primaryColor),
      ));
}
