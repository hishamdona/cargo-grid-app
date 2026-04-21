import 'package:flutter/material.dart';
import '../features/shipper/screens/shipper_home.dart';
import '../features/shipper/screens/shipments_screen.dart';
import '../features/shipper/screens/tracking_screen.dart';
import '../features/shipper/screens/payments_screen.dart';
import '../features/shipper/screens/shipper_profile.dart';

class ShipperNavigation extends StatefulWidget {
  const ShipperNavigation({super.key});

  @override
  State<ShipperNavigation> createState() => _ShipperNavigationState();
}

class _ShipperNavigationState extends State<ShipperNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    ShipperHome(),
    ShipmentsScreen(),
    TrackingScreen(),
    PaymentsScreen(),
    ShipperProfile(),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Shipments',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Track'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payments'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
