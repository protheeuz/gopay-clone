import 'package:flutter/material.dart';
import 'package:myapp/screens/choose_mode.dart';
import 'package:myapp/screens/onboarding_screen.dart';
import 'package:myapp/screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String mode = '/mode';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splash: (context) => const SplashSreen(),
      onboarding: (context) => const OnBoardingScreen(),
      mode: (context) => const ChooseMode()
    };
  }
}
