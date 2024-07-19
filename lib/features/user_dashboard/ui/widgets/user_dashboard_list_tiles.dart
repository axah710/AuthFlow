import 'package:flutter/material.dart';
import 'package:online_auth_system/core/helpers/extinsions.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';

class UserDashboardListTiles extends StatelessWidget {
  const UserDashboardListTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [GestureDetector(
                  onTap: () {
                    context.pushNamed(Routes.userAccount);
                  },
                  child:  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text("My Profile", style: AppTextStyles.font18BlackRegular,),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                verticalSpace(6),
                const ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Log Out"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),],);
  }
}
