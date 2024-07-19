import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/helpers/extinsions.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/app_text_button.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/register/ui/widgets/already_have_an_account.dart';
import 'package:online_auth_system/features/register/ui/widgets/alterantive_accounts.dart';
import 'package:online_auth_system/features/register/ui/widgets/app_icon_and_register_text.dart';
import 'package:online_auth_system/features/register/ui/widgets/register_form.dart';

class RegisterScreen extends StatefulWidget {
  final String role;

  const RegisterScreen({
    super.key,
    required this.role,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  verticalSpace(44),
                  const AppIconAndRegisterText(),
                  verticalSpace(60),
                  Column(
                    children: [
                      RegisterForm(
                        role: widget.role,
                      ),
                      verticalSpace(20),
                      AppTextButton(
                        buttonText: "Register",
                        textStyle: AppTextStyles.font16BlackMedium,
                        onPressed: () {
                          context.pushNamed(Routes.userDashboard);
                        }, shadowColor: Colors.red.withOpacity(0.5),
                      ),
                      verticalSpace(30),
                      const Text("or register with"),
                      verticalSpace(20),
                      const AlterantiveAccounts(),
                      verticalSpace(20),
                      AlreadyHaveAnAccount(
                        role: widget.role,
                      ),
                      verticalSpace(60),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
