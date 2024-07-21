import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_auth_system/core/routing/app_router.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/core/theming/app_colors.dart';
import 'package:online_auth_system/features/auth/logic/cubit/auth_cubit.dart';
import 'package:online_auth_system/features/onboarding/ui/screens/onboarding_first_screen.dart';

class OnlineAuthSystem extends StatelessWidget {
  final AppRouter appRouter;

  const OnlineAuthSystem({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // Adapt the UI to different screen sizes and orientations.
        designSize: const Size(375, 812),
        // specifies the base design size for the app, which helps in scaling
        //the UI elements appropriately.
        minTextAdapt: true,
        // ensures that text scales according to the screen size.
        splitScreenMode: true,
        //  allows the app to handle split-screen mode effectively.
        child: BlocProvider(
          create: (context) => AuthCubit(role: 'user'),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Online Auth System',
            theme: ThemeData(
              primaryColor: AppColorsManager.primaryBlueColor,
              scaffoldBackgroundColor: Colors.white,
            ),
            initialRoute: Routes.onBoardingScreen,
            onGenerateRoute: appRouter.generateRoute,
            home: const OnBoardingScreen(),
          ),
        ));
  }
}
