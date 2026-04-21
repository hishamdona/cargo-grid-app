import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/shipment_provider.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ShipmentProvider()),
      ],
      child: const CargoGridApp(),
    ),
  );
}

class CargoGridApp extends StatelessWidget {
  const CargoGridApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CargoGrid',
      theme: AppTheme.lightTheme,
      home: const AppRouter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
