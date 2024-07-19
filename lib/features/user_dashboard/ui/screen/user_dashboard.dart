import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/user_dashboard/ui/widgets/user_dashboard_list_tiles.dart';
import 'package:online_auth_system/features/user_dashboard/ui/widgets/user_dashboard_image_and_user_email_and_name.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(right: 15.w, left: 15.w),
            child: Column(
              children: [
                verticalSpace(30),
                const UserDashboardImageAndUserEmailAndName(),
                verticalSpace(48),
                const UserDashboardListTiles(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
