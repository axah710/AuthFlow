import 'package:flutter/material.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/core/widgets/svg_displayer.dart';

class AlterantiveRegister extends StatelessWidget {
  const AlterantiveRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SvgDisplayer(
          assetName: "assets/svgs/google_login_alternative.svg",
        ),
        // Displays a Google login SVG icon.
        horizontalSpace(32),
        const SvgDisplayer(
          assetName: "assets/svgs/facebook_login_alternative.svg",
        ),
      ],
    );
  }
}
