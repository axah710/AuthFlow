import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/helpers/extinsions.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/theming/app_colors.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/app_text_button.dart';
import 'package:online_auth_system/core/widgets/image_displayer.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/get_started/ui/widgets/onboarding_arrow_button.dart';

class OnBoardingThirdScreen extends StatelessWidget {
  const OnBoardingThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 63.h,
              left: 20.w,
              right: 20.w,
            ),
            child: Column(
              children: [
                const ImageDisplayer(
                  assetName: "assets/images/authflow3.png",
                  height: 245,
                  width: 245,
                ),
                verticalSpace(30),
                AppTextButton(
                  buttonText: "Biometric",
                  textStyle: AppTextStyles.font16WhiteBold,
                  backgroundColor: AppColorsManager.red,
                  buttonHeight: 46,
                  buttonWidth: 103,
                  onPressed: () {},
                ),
                verticalSpace(20),
                Text(
                  "Biometric Traits Authentication",
                  style: AppTextStyles.font16BlackMedium,
                ),
                verticalSpace(30),
                Text(
                  "Your identity is our priority. We use cutting-edge biometric authentication, such as fingerprints or facial recognition, ensuring only you can access your account. This enhances security and provides a personalized user experience.",
                  style: AppTextStyles.font14BlackRegular,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(77),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: const OnBoardingArrowButton(
                        icon: Icons.arrow_back_ios_rounded,
                      ),
                    ),
                    horizontalSpace(15),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.selectRoleScreen);
                      },
                      child: const OnBoardingArrowButton(
                        icon: Icons.arrow_forward_ios_rounded,
                      ),
                    ),
                  ],
                ),
                verticalSpace(66),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
