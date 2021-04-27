// Horizontal Spacing
import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 14.0);
const Widget horizontalSpaceRegular = SizedBox(width: 24.0);
const Widget horizontalSpaceMedium = SizedBox(width: 34.0);
const Widget horizontalSpaceLarge = SizedBox(width: 40.0);

const Widget verticalSpaceTiny = SizedBox(width: 5.0);
const Widget verticalSpaceSmall = SizedBox(width: 14.0);
const Widget verticalSpaceRegular = SizedBox(width: 24.0);
const Widget verticalSpaceMedium = SizedBox(width: 34.0);
const Widget verticalSpaceLarge = SizedBox(width: 40.0);

Widget customVerticalSpace({required double height}) => SizedBox(
      height: height,
    );
Widget customHorizontalSpace({required double width}) => SizedBox(
      width: width,
    );

// Screen Size Helpers'

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
