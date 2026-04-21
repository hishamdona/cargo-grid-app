import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../features/auth/login_screen.dart';
import 'shipper_navigation.dart';
import 'driver_navigation.dart';

import '../providers/onboarding_provider.dart';
import '../features/onboarding/screens/splash_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  bool _splashFinished = false;

  @override
  Widget build(BuildContext context) {
    final onboardingProvider = context.watch<OnboardingProvider>();
    final authProvider = context.watch<AuthProvider>();

    // 1. Splash Screen
    if (!_splashFinished || onboardingProvider.isLoading) {
      return SplashScreen(
        onInitializationComplete: () {
          setState(() {
            _splashFinished = true;
          });
        },
      );
    }

    // 2. Onboarding Flow
    if (onboardingProvider.isFirstTime) {
      return const OnboardingScreen();
    }

    // 3. Auth Flow
    if (!authProvider.isAuthenticated || authProvider.user == null) {
      return const LoginScreen();
    }

    final user = authProvider.user!;
    if (user.isShipper) {
      return const ShipperNavigation();
    } else if (user.isDriver) {
      return const DriverNavigation();
    }

    // Fallback
    return const Scaffold(
      body: Center(child: Text('Unknown Role')),
    );
  }
}
