import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/theming/app_colors.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/app_text_button.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/user_account/ui/widgets/user_account_form.dart';

class UserAccount extends StatelessWidget {
  final String role;

  const UserAccount({super.key, required this.role});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 15.w, left: 15.w),
            child: Column(
              children: [
                verticalSpace(55),
                UserAccountForm(
                  role: role,
                ),
                verticalSpace(72),
                AppTextButton(
                  buttonText: "Update Profile",
                  onPressed: () {},
                  textStyle: AppTextStyles.font16WhiteSemiBold,
                  buttonHeight: 54,
                  buttonWidth: 216,
                  backgroundColor: AppColorsManager.red.withOpacity(0.9),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
