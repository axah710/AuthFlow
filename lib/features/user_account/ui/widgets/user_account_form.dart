import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/role_text_form_field.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/core/widgets/text_form_field.dart';
import 'package:online_auth_system/features/auth/logic/cubit/auth_cubit.dart';

class UserAccountForm extends StatelessWidget {
  final String role;

  const UserAccountForm({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    var user = context.read<AuthCubit>().user!;

    return Column(
      children: [
        verticalSpace(16),
        Text(
          "Email Account",
          style: AppTextStyles.font18BlackRegular,
        ),
        verticalSpace(16),
        AppTextFormField(
          hintText: user.email!,
          hintStyle: AppTextStyles.font18BlackRegular,
        ),
        verticalSpace(72),
        Text(
          role,
          style: AppTextStyles.font18BlackRegular,
        ),
        verticalSpace(16),
        RoleTextFormField(hintText: role),
      ],
    );
  }
}
