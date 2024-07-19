import 'package:flutter/material.dart';
import 'package:online_auth_system/core/helpers/app_regex.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/core/widgets/text_form_field.dart';

class SigninForm extends StatefulWidget {
  final String role;
  const SigninForm({super.key, required this.role});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Email",
          style: AppTextStyles.font16BlackMedium,
        ),
        verticalSpace(5),
        AppTextFormField(
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
        AppTextFormField(
          hintText: widget.role,
        ),
      ],
    );
  }
}
