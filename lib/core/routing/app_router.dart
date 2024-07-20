import 'package:flutter/material.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/features/admin_dashboard/ui/screens/admin_dashboard.dart';
import 'package:online_auth_system/features/onboarding/ui/screens/onboarding_first_screen.dart';
import 'package:online_auth_system/features/onboarding/ui/screens/onboarding_second_screen.dart';
import 'package:online_auth_system/features/onboarding/ui/screens/onboarding_third_screen.dart';
import 'package:online_auth_system/features/register/ui/screen/register_screen.dart';
import 'package:online_auth_system/features/select_role/ui/screen/select_role_screen.dart';
import 'package:online_auth_system/features/signin/ui/screens/signin_screen.dart';
import 'package:online_auth_system/features/user_dashboard/ui/screen/user_dashboard.dart';
import '../../features/user_account/ui/screens/user_account.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    String role = '';
    // String userId = '';

    if (settings.arguments != null) {
      if (settings.arguments is Map<String, String>) {
        final args = settings.arguments as Map<String, String>;
        role = args['role'] ?? '';
        // userId = args['userId'] ?? '';
      } else if (settings.arguments is String) {
        // Handle if arguments is a single String, e.g., role
        role = settings.arguments as String;
      }
    }

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.onBoardingSecondScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingSecondScreen(),
        );
      case Routes.onBoardingThirdScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingThirdScreen(),
        );

      case Routes.selectRoleScreen:
        return MaterialPageRoute(
          builder: (context) => const SelectRoleScreen(),
        );

      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(
            role: role,
          ),
        );
      case Routes.signinScreen:
        return MaterialPageRoute(
          builder: (context) => SigninScreen(
            role: role,
          ),
        );
      case Routes.userDashboard:
        return MaterialPageRoute(
          builder: (context) => const UserDashboard(
            // role: role,
          ),
        );
      case Routes.userAccount:
        return MaterialPageRoute(
          builder: (context) => UserAccount(
            role: role,
          ),
        );
      case Routes.adminDashboard:
        return MaterialPageRoute(
          builder: (context) => AdminDashboard(
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                "No route defined for ${settings.name}",
              ),
            ),
          ),
        );
    }
  }
}
