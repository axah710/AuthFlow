// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:online_auth_system/core/theming/app_fonts.dart';
// import 'package:online_auth_system/core/widgets/image_displayer.dart';
// import 'package:online_auth_system/core/widgets/spacing.dart';

// class UserDashboardImageAndUserEmailAndName extends StatelessWidget {
//   final Map<String, dynamic> userData;
//   const UserDashboardImageAndUserEmailAndName({super.key, required this.userData});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(100),
//           child: ImageDisplayer(
//             fit: BoxFit.cover,
//             assetName: "assets/images/me.jpg",
//             height: 105.h,
//             width: 105.w,
//           ),
//         ),
//         horizontalSpace(16),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Role: ${userData['role']}',
//               style: AppTextStyles.font18BlackRegular,
//             ),
//             Text(
//               'Email: ${userData['email']}',
//               style: AppTextStyles.font18BlackRegular,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
