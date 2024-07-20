import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:online_auth_system/core/helpers/extinsions.dart';
import 'package:online_auth_system/core/helpers/showsnackbarmessage.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/register/logic/cubit/auth_cubit.dart';
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
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupLoadingState) {
          isLoading = true;
        } else if (state is SignupSucessState) {
          isLoading = false;
          showSnackBarMessage(context, state.sucessMessage);
          context.pushReplacementNamed(
            Routes.userDashboard,
            arguments: state.role,
            
          );
        } else if (state is SignupFailureState) {
          isLoading = false;
          showSnackBarMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
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
                        const AppIconAndRegisterText(),
                        verticalSpace(60),
                        Column(
                          children: [
                            RegisterForm(
                              role: widget.role,
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
          ),
        );
      },
    );
  }
}
