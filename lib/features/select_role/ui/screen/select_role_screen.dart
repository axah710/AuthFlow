import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/select_role/ui/widgets/app_name_and_logo.dart';
import 'package:online_auth_system/features/select_role/ui/widgets/role_card.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
              top: 35.h,
            ),
            child: Center(
              child: Column(
                children: [
                  const AppNameAndLogo(),
                  verticalSpace(32),
                  Text(
                    "Select Role",
                    style: AppTextStyles.font24BlackBold,
                  ),
                  verticalSpace(32),
                  const RoleCard(
                    role: 'Admin',
                    roleDescription:
                        "Full control over system settings and user management.",
                  ),
                  verticalSpace(16),
                  const RoleCard(
                    role: 'User',
                    roleDescription:
                        "Access to essential app features and limited system settings.",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
