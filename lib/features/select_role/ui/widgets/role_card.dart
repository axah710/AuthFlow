import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/theming/app_fonts.dart';
import 'package:online_auth_system/core/widgets/spacing.dart';

class RoleCard extends StatelessWidget {
  final String role;
  final String roleDescription;
  final void Function() onTap;
  const RoleCard({
    super.key,
    required this.role,
    required this.roleDescription,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 150.h,
        width: double.infinity,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                // Wraps the first Padding and Column inside an
                //Expanded widget.
                // This tells the Row to allocate remaining space to
                // this child after laying out other non-flexible
                // children.
                // Prevents the overflow by making sure this child
                //only takes the space available.
                // How Expanded Works
                // Without Expanded: The Column takes its natural
                //width, possibly exceeding the available space,
                //causing overflow.
                // With Expanded: The Column takes up only the
                //remaining space after other non-flexible children
                //are laid out, ensuring it fits within the
                //available width.
                // This adjustment prevents the overflow error by
                //making the Column flexible in width, adapting to
                //the available space. This ensures that the layout
                //is responsive and does not exceed the boundaries
                //of the parent Row.
                child: Padding(
                  padding: EdgeInsets.only(
                    // bottom: 30.h,
                    left: 24.w,
                    // top: 21.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        role,
                        style: AppTextStyles.font16BlackExtraBold,
                      ),
                      verticalSpace(10),
                      Text(
                        roleDescription,
                        style: AppTextStyles.font14GreyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 30.h,
                  right: 11.w,
                ),
                child: Image.asset(
                  "assets/images/role.png",
                  height: 120.h,
                  width: 105.w,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
