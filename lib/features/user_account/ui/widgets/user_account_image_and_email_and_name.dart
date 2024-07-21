import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/image_displayer.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/auth/logic/cubit/auth_cubit.dart';

class UserAccountImageAndEmailAndName extends StatelessWidget {
  final String role;
  const UserAccountImageAndEmailAndName({super.key, required this.role});

  @override
  Widget build(BuildContext context) {
    var user = context.read<AuthCubit>().user!;

    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: ImageDisplayer(
            fit: BoxFit.cover,
            assetName: "assets/images/me.jpg",
            height: 105.h,
            width: 105.w,
          ),
        ),
        horizontalSpace(16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.email!,
              style: AppTextStyles.font18BlackRegular,
            ),
            Text(
              role,
              style: AppTextStyles.font18BlackRegular,
            ),
          ],
        ),
      ],
    );
  }
}
