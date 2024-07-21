import 'package:flutter/material.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/image_displayer.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';

class AppIconAndRegisterText extends StatelessWidget {
  const AppIconAndRegisterText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageDisplayer(
          assetName: "assets/images/Authentication.png",
          height: 75,
          width: 75,
        ),
        verticalSpace(35),
        Text(
          "Register",
          style: AppTextStyles.font24BlackMedium,
        ),
      ],
    );
  }
}
