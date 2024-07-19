import 'package:flutter/material.dart';
import 'package:online_auth_system/core/routing/routes.dart';
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
    late final String role;
    // This line declares role as a variable that will be initialized later
    // and can only be assigned once.

    if (settings.arguments != null) {
      role = settings.arguments as String;
    }
    // Condition Check: The if statement checks if settings.arguments is not null.
    // Assignment: If the condition is true, it assigns the value of settings.
    // arguments to role, casting it to a String. This ensures that role is only
    // set when there is an argument passed.
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
          builder: (context) => const UserDashboard(),
        );
 case Routes.userAccount:
        return MaterialPageRoute(
          builder: (context) => const UserAccount(),
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
// The code snippet is a class named AppRouter that contains a method
// generateRoute which determines the route to be displayed based
// on the provided settings.
// The method generateRoute takes a settings object as input.
// It checks the name property of the settings object using a switch statement.
// If the name matches Routes.onBoardingScreen, it returns a
// MaterialPageRoute with a screen.
// If the name matches Routes.loginScreen, it returns a
// MaterialPageRoute with a screen.
// If no match is found, it returns a MaterialPageRoute with a Scaffold
// displaying a message indicating the route name that was not defined.
