import 'package:flutter/material.dart';

const Widget horizontalSpace5 = SizedBox(width: 5.0);
const Widget horizontalSpace10 = SizedBox(width: 10.0);
const Widget horizontalSpace14 = SizedBox(width: 14.0);
const Widget horizontalSpace24 = SizedBox(width: 24.0);
const Widget horizontalSpace34 = SizedBox(width: 34.0);
const Widget horizontalSpace40 = SizedBox(width: 40.0);

const Widget verticalSpace5 = SizedBox(height: 5.0);
const Widget verticalSpace10 = SizedBox(height: 10.0);
const Widget verticalSpace14 = SizedBox(height: 14.0);
const Widget verticalSpace24 = SizedBox(height: 24.0);
const Widget verticalSpace34 = SizedBox(height: 34.0);
const Widget verticalSpace40 = SizedBox(height: 40.0);

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
