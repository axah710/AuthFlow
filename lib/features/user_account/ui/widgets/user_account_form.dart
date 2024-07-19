import 'package:flutter/material.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/core/widgets/text_form_field.dart';

class UserAccountForm extends StatelessWidget {
    final String role;

  const UserAccountForm({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Name",
          style: AppTextStyles.font18BlackRegular,
        ),
        verticalSpace(16),
        AppTextFormField(
          hintText: "Your Name",
          hintStyle: AppTextStyles.font18BlackRegular,
        ),
        verticalSpace(72),
        Text(
          "Email Account",
          style: AppTextStyles.font18BlackRegular,
        ),
        verticalSpace(16),
        AppTextFormField(
          hintText: "yourname@gmail.com",
          hintStyle: AppTextStyles.font18BlackRegular,
        ),
        verticalSpace(72),
        Text(
          "Your Role",
          style: AppTextStyles.font18BlackRegular,
        ),
        verticalSpace(16),
        AppTextFormField(
          hintText: role,
          hintStyle: AppTextStyles.font18BlackRegular,
        ),
      ],
    );
  }
}
