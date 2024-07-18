import 'package:flutter/material.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/image_displayer.dart';

class AppNameAndLogo extends StatelessWidget {
  const AppNameAndLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ImageDisplayer(
          assetName: "assets/images/Authentication.png",
          height: 65,
          width: 65,
        ),
        Text(
          "AuthFlow",
          style: AppTextStyles.font24RedSemiBold,
        ),
      ],
    );
  }
}
