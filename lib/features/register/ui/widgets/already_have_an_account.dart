import 'package:flutter/material.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

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
                              // Navigator.pushNamed(context, AppRoutes.loginScreen);
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