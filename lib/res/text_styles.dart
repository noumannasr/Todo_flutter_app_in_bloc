import 'package:flutter/material.dart';
import 'package:todo_app_with_block/res/colors.dart';


class TextStylesData {
  static double tooSmallFontSize = 10.0;
  static double extraSmallFontSize = 12.0;
  static double smallFontSize = 14.0;
  static double mediumFontSize = 17.0;
  static double titleFontSize = 19.0;
  static double largeFontSize = 24.0;
  static double headingLarge1FontSize = 28.0;
  static double headingLargeFontSize = 33.0;
  static double headingSmallFontSize = 29.0;
  static double appBarRound = 25.0;

  static TextStyle smallTextStyle = TextStyle(
    fontSize: smallFontSize,
    color: AppColors.blackColor,
  );
  static TextStyle largeHeadingTextStyle = TextStyle(
    fontSize: headingLargeFontSize,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w400,
  );
  static TextStyle titleTextStyle = TextStyle(
    fontSize: headingLargeFontSize,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle normalTextStyle = TextStyle(
    fontSize: 25,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle whiteTextStyle = TextStyle(
    fontSize: smallFontSize,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.bold,
  );

  static TextStyle blackSubtitleText = TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
  static TextStyle graphSmallText = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
  );

}
