import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/theming/app_colors.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';

class RoleTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final String hintText;
  final Widget? suffixIcon;
  final Color? fillColor;

  const RoleTextFormField({
    super.key,
    this.contentPadding,
    this.hintStyle,
    this.suffixIcon,
    required this.hintText,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: false,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 23.0.w,
              vertical: 16.0.h,
            ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(
            color: AppColorsManager.lighterGray,
            width: 1.3.w,
          ),
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(16.r),
        //   borderSide: BorderSide(
        //     color: AppColorsManager.lighterGray,
        //     width: 1.3.w,
        //   ),
        // ),
        hintStyle: hintStyle ?? AppTextStyles.font14GreyMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
        fillColor: fillColor ?? AppColorsManager.moreLightGray,
        filled: true,
      ),
    );
  }
}
