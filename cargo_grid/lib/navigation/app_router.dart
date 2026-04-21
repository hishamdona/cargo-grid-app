import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../features/auth/login_screen.dart';
import 'shipper_navigation.dart';
import 'driver_navigation.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
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
        return const Scaffold(body: Center(child: Text('Unknown Role')));
      },
    );
  }
}
