import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/theming/app_colors.dart';
import 'package:online_auth_system/core/theming/font_weight_helper.dart';

class AppTextStyles {
  static TextStyle font16WhiteBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeightHelper.bold,
    color: AppColorsManager.white,
  );
  static TextStyle font14BlackRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeightHelper.regular,
    color: AppColorsManager.black,
  );
   static TextStyle font16BlackMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeightHelper.medium,
    color: AppColorsManager.black,
  );
    static TextStyle font12BlackRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: AppFontWeightHelper.regular,
    color: AppColorsManager.black,
  );
}
// The code snippet defines a class AppTextStyles containing multiple static
// properties, each representing a TextStyle object with specific font size,
// font weight, and color.