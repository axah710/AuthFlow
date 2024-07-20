// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:online_auth_system/core/helpers/extinsions.dart';
import 'package:online_auth_system/core/helpers/showsnackbarmessage.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/register/data/firestore_service.dart';
import 'package:online_auth_system/features/register/logic/cubit/auth_cubit.dart';
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
  bool isLoading = false;
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> validateThenDoSignin(BuildContext context) async {
    if (context.read<AuthCubit>().loginFormKey.currentState!.validate()) {
      User? user = await context.read<AuthCubit>().signInWithEmail(
            context.read<AuthCubit>().emailController.text,
            context.read<AuthCubit>().passwordController.text,
          );

      if (user != null) {
        try {
          // Retrieve user data from Firestore
          DocumentSnapshot userData = await _firestoreService.getUser(user.uid);
          String role = userData['role'];

          if (role == 'Admin') {
            // Navigate to Admin Dashboard
            if (context.mounted) {
              context.pushReplacementNamed(
                Routes.adminDashboard,
                arguments: {'role': role, 'userId': user.uid},
              );
            }
          } else {
            // Navigate to User Dashboard

            context.pushReplacementNamed(
              Routes.userDashboard,
              arguments: user.uid,
            );
          }
        } catch (e) {
          showSnackBarMessage(context, 'Error fetching user data');
        }
      } else {
        showSnackBarMessage(
            context, 'Sign in failed. Please check your credentials.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is LoginLoadingState) {
        setState(() {
          isLoading = true;
        });
      } else if (state is LoginSucessState) {
        setState(() {
          isLoading = false;
        });
        validateThenDoSignin(context); // Call your method here
      } else if (state is LoginFailureState) {
        setState(() {
          isLoading = false;
        });
        showSnackBarMessage(context, state.errorMessage);
      }
    }, builder: (context, state) {
      return Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: isLoading,
          child: SafeArea(
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
                                  context.pushNamed(
                                    Routes.registerScreen,
                                    arguments: widget.role,
                                  );
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
        ),
      );
    });
  }
}
