import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingArrowButton extends StatelessWidget {
  final IconData icon;
  const OnBoardingArrowButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
          width: 2.0.w,
        ),
        borderRadius: BorderRadius.circular(5.0.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 11.0.w,
          vertical: 11.0.h,
        ),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
