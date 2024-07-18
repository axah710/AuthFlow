import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/helpers/extinsions.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/theming/app_colors.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/app_text_button.dart';
import 'package:online_auth_system/core/widgets/image_displayer.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/onboarding/ui/widgets/onboarding_arrow_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

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
                  assetName: "assets/images/authflow1.png",
                  height: 245,
                  width: 245,
                ),
                verticalSpace(30),
                AppTextButton(
                  buttonText: "Secret",
                  textStyle: AppTextStyles.font16WhiteBold,
                  backgroundColor: AppColorsManager.red,
                  buttonHeight: 46,
                  buttonWidth: 90,
                  onPressed: () {},
                ),
                verticalSpace(20),
                Text(
                  "User Secret Authentiction",
                  style: AppTextStyles.font16BlackMedium,
                ),
                verticalSpace(30),
                Text(
                  "We prioritize your digital safety with a secure User Secret approach, ensuring passwords and PINs remain confidential, creating a robust shield for a private and protected user experience.",
                  style: AppTextStyles.font14BlackRegular,
                  textAlign: TextAlign.center,
                ),
                verticalSpace(77),
                GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.onBoardingSecondScreen);
                  },
                  child: const OnBoardingArrowButton(
                    icon: Icons.arrow_forward_ios_rounded,
                  ),
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
