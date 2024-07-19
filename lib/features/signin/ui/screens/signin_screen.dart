import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/app_text_button.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/register/ui/widgets/alterantive_accounts.dart';
import 'package:online_auth_system/features/signin/ui/widgets/app_icon_and_signin_text.dart';
import 'package:online_auth_system/features/signin/ui/widgets/sign_in_form.dart';

class SigninScreen extends StatefulWidget {
  final String role;
  const SigninScreen({super.key, required this.role});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
                  const AppIconAndSigninText(),
                  verticalSpace(60),
                  Column(
                    children: [
                      SigninForm(
                        role: widget.role,
                      ),
                      verticalSpace(20),
                      AppTextButton(
                        buttonText: "Signin",
                        textStyle: AppTextStyles.font16BlackMedium,
                        onPressed: () {},
                      ),
                      verticalSpace(30),
                      const Text("or Signin with"),
                      verticalSpace(20),
                      const AlterantiveAccounts(),
                      verticalSpace(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "New user AuthFlow? Register ",
                            style: AppTextStyles.font16BlackExtraBold,
                          ),
                          verticalSpace(5),
                          GestureDetector(
                            onTap: () {
                              // context.pushNamed(Routes.signinScreen, arguments: role);
                            },
                            child: Text(
                              "Here",
                              style: AppTextStyles.font16RedMedium,
                            ),
                          ),
                          verticalSpace(60),
                        ],
                      ),
                    ],
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
