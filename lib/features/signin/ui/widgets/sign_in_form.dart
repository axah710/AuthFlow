import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_auth_system/core/helpers/app_regex.dart';
import 'package:online_auth_system/core/helpers/extinsions.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/app_text_button.dart';
import 'package:online_auth_system/core/widgets/role_text_form_field.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/core/widgets/text_form_field.dart';
import 'package:online_auth_system/features/register/data/firestore_service.dart';
import 'package:online_auth_system/features/register/logic/cubit/auth_cubit.dart';

class SigninForm extends StatefulWidget {
  final String role;
  const SigninForm({super.key, required this.role});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  final FirestoreService _firestoreService = FirestoreService();
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<AuthCubit>().loginFormKey,
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
            "Password",
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
            "Your Role",
            style: AppTextStyles.font16BlackMedium,
          ),
          verticalSpace(5),
          RoleTextFormField(
            hintText: widget.role,
          ),
          verticalSpace(20),
          AppTextButton(
            buttonText: "Signin",
            textStyle: AppTextStyles.font16BlackMedium,
            onPressed: () {
              validateThenDoSignin(context);
            },
            shadowColor: Colors.red.withOpacity(0.5),
          ),
          verticalSpace(30),
        ],
      ),
    );
  }

  Future<void> validateThenDoSignin(BuildContext context) async {
    if (context.read<AuthCubit>().loginFormKey.currentState!.validate()) {
      User? user = await context.read<AuthCubit>().signInWithEmail(
            context.read<AuthCubit>().emailController.text,
            context.read<AuthCubit>().passwordController.text,
          );

      if (user != null) {
        // Retrieve user data from Firestore
        DocumentSnapshot userData = await _firestoreService.getUser(user.uid);
        String role = userData['role'];

        if (role == 'admin'&& context.mounted) {
          context.pushReplacementNamed(
            Routes.adminDashboard,
            arguments: {'role': role, 'userId': user.uid},
          );
        } else {
          if (context.mounted) {
  context.pushReplacementNamed(
    Routes.userDashboard,
    arguments: user.uid,
  );
}
        }
      }
    }
  }
}
