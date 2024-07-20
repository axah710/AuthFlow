import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_auth_system/core/helpers/app_regex.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/app_text_button.dart';
import 'package:online_auth_system/core/widgets/role_text_form_field.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/core/widgets/text_form_field.dart';
import 'package:online_auth_system/features/register/data/firestore_service.dart';
import 'package:online_auth_system/features/register/logic/cubit/auth_cubit.dart';

class RegisterForm extends StatefulWidget {
  final String role;

  const RegisterForm({super.key, required this.role});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final FirestoreService _firestoreService = FirestoreService();
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().registerFormKey,
      child: Column(
        children: [
          Text(
            "Email",
            style: AppTextStyles.font16BlackMedium,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: context.read<AuthCubit>().emailController,
            hintText: 'example@gmail.com',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          verticalSpace(20),
          Text(
            "Create Password",
            style: AppTextStyles.font16BlackMedium,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: context.read<AuthCubit>().passwordController,
            hintText: '. . . . . . . .',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(20),
          Text(
            "Confirm Password",
            style: AppTextStyles.font16BlackMedium,
          ),
          verticalSpace(5),
          AppTextFormField(
            controller:
                context.read<AuthCubit>().passwordConfirmationController,
            hintText: '. . . . . . . .',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(20),
          Text(
            "Your Role",
            style: AppTextStyles.font16BlackMedium,
          ),
          verticalSpace(5),
          RoleTextFormField(
            hintText: widget.role,
          ),
          verticalSpace(20),
          AppTextButton(
            buttonText: "Register",
            textStyle: AppTextStyles.font16BlackMedium,
            onPressed: () {
              validateThenDoRegister(context);
            },
            shadowColor: Colors.red.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Future<void> validateThenDoRegister(BuildContext context) async {
    if (context.read<AuthCubit>().registerFormKey.currentState!.validate()) {
      User? user = await context.read<AuthCubit>().registerWithEmail(
            context.read<AuthCubit>().emailController.text,
            context.read<AuthCubit>().passwordController.text,
          );
      if (user != null && context.mounted) {
        await _firestoreService.createUser(
          user.uid,
          context.read<AuthCubit>().emailController.text,
          widget.role,
        );
      }
    }
  }
}
