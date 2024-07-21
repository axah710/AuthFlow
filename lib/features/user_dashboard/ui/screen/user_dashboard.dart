import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';
import 'package:online_auth_system/features/auth/logic/cubit/auth_cubit.dart';
import 'package:online_auth_system/features/register/ui/screen/register_screen.dart';

import 'package:online_auth_system/features/user_dashboard/ui/widgets/user_dashboard_list_tiles.dart';

class UserDashboard extends StatefulWidget {
//  final String role;
  // final String userId;

  const UserDashboard({
    super.key,
  });

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    var userId = context.read<AuthCubit>().user!.uid;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<DocumentSnapshot>(
            future: firestoreService.getUser(userId),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || !snapshot.data!.exists) {
                return const Center(child: Text('User not found'));
              } else {
                Map<String, dynamic> userData =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Padding(
                  padding: EdgeInsets.only(
                    right: 15.w,
                    left: 15.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(55),
                      Text(
                        'Email: ${userData['email']}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Role: ${userData['role']}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      verticalSpace(48),
                      UserDashboardListTiles(
                        role: userData['role'],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
// Padding(
//               padding: EdgeInsets.only(right: 15.w, left: 15.w),
//               child: Column(
//                 children: [
//                   verticalSpace(30),
//                   const UserDashboardImageAndUserEmailAndName(),
//                   verticalSpace(48),
//                   UserDashboardListTiles(
//                     role: widget.role,
//                   ),
//                 ],
//               ),
//             ),
