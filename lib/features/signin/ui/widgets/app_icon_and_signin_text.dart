import 'package:flutter/material.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/image_displayer.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';

class AppIconAndSigninText extends StatelessWidget {
  const AppIconAndSigninText({super.key});

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
          "Signin",
          style: AppTextStyles.font24BlackMedium,
        ),
      ],
    );
  }
}
