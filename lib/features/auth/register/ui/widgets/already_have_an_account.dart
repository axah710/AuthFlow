import 'package:flutter/material.dart';
import 'package:online_auth_system/core/helpers/extinsions.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final String role;

  const AlreadyHaveAnAccount({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? Login ",
          style: AppTextStyles.font16BlackExtraBold,
        ),
        verticalSpace(5),
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.signinScreen, arguments: role);
          },
          child: Text(
            "Here",
            style: AppTextStyles.font16RedMedium,
          ),
        ),
      ],
    );
  }
}
