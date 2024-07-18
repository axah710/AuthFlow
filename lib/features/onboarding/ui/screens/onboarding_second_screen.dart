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

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({super.key});

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
                  assetName: "assets/images/authflow2.png",
                  height: 245,
                  width: 245,
                ),
                verticalSpace(30),
                AppTextButton(
                  buttonText: "Possesion",
                  textStyle: AppTextStyles.font16WhiteBold,
                  backgroundColor: AppColorsManager.red,
                  buttonHeight: 46,
                  buttonWidth: 104,
                  onPressed: () {},
                ),
                verticalSpace(20),
                Text(
                  "Possession Factor Authentication",
                  style: AppTextStyles.font16BlackMedium,
                ),
                verticalSpace(30),
                Text(
                  "Enhancing security, we use a Possession Factor strategy, requiring a physical item like a token or mobile device for authentication. This extra layer of defense fortifies your access and ensures peace of mind.",
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
                        context.pushNamed(
                          Routes.onBoardingThirdScreen,
                        );
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
