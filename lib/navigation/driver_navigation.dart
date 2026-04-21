import 'package:flutter/material.dart';
import '../features/driver/screens/available_loads_screen.dart';
import '../features/driver/screens/active_trips_screen.dart';
import '../features/driver/screens/earnings_screen.dart';
import '../features/driver/screens/driver_profile.dart';
import '../core/theme/app_colors.dart';

class DriverNavigation extends StatefulWidget {
  const DriverNavigation({super.key});

  @override
  State<DriverNavigation> createState() => _DriverNavigationState();
}

class _DriverNavigationState extends State<DriverNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const AvailableLoadsScreen(),
    const ActiveTripsScreen(),
    // Map Placeholder
    Scaffold(
      appBar: AppBar(title: const Text('Map Navigation')),
      body: Container(
        color: Colors.grey.shade300,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.map, size: 64, color: AppColors.textSecondary),
              SizedBox(height: 16),
              Text(
                'Map View Placeholder',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    const EarningsScreen(),
    const DriverProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.view_list), label: 'Loads'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Trips',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Earnings',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
