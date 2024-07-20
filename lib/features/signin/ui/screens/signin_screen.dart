import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:online_auth_system/core/helpers/extinsions.dart';
import 'package:online_auth_system/core/helpers/showsnackbarmessage.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is LoginLoadingState) {
        isLoading = true;
      } else if (state is LoginSucessState) {
        isLoading = false;
        context.pushReplacementNamed(
          Routes.userDashboard,
          arguments: state.user,
        );
      } else if (state is LoginFailureState) {
        isLoading = false;
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
