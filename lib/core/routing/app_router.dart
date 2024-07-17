import 'package:flutter/material.dart';
import 'package:online_auth_system/core/routing/routes.dart';
import 'package:online_auth_system/features/get_started/ui/screens/onboarding_first_screen.dart';
import 'package:online_auth_system/features/get_started/ui/screens/onboarding_second_screen.dart';
import 'package:online_auth_system/features/get_started/ui/screens/onboarding_third_screen.dart';
import 'package:online_auth_system/features/select_role/ui/screen/select_role_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
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
