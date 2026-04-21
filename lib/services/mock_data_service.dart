import '../models/shipment_model.dart';
import '../models/user_model.dart';

class MockDataService {
  static final List<ShipmentModel> mockShipments = [
    ShipmentModel(
      tripId: 'TRP-2025-001',
      pickupLocation: 'Kubwa, Abuja FCT',
      dropoffLocation: 'Gwarimpa Estate, Abuja',
      weightKg: 1200,
      amount: 25000,
      currency: 'NGN',
      goodsDescription: 'Electronics & Gadgets Pallet',
      pickupTime: DateTime.now().add(const Duration(hours: 2)),
      status: 'Pending',
    ),
    ShipmentModel(
      tripId: 'TRP-2025-002',
      pickupLocation: 'Ikeja, Lagos State',
      dropoffLocation: 'Ring Road, Ibadan',
      weightKg: 800,
      amount: 45000,
      currency: 'NGN',
      goodsDescription: 'Living Room Furniture Set',
      pickupTime: DateTime.now().subtract(const Duration(hours: 1)),
      status: 'In Transit',
      driverName: 'Samuel Okafor',
      driverPhone: '+234 803 000 0001',
      truckType: 'Enclosed Box Truck',
    ),
    ShipmentModel(
      tripId: 'TRP-2025-003',
      pickupLocation: 'Trans-Amadi, Port Harcourt',
      dropoffLocation: 'Market Road, Aba',
      weightKg: 1500,
      amount: 60000,
      currency: 'NGN',
      goodsDescription: 'Cement & Building Materials',
      pickupTime: DateTime.now().subtract(const Duration(days: 2)),
      status: 'Delivered',
      driverName: 'Chinedu Eze',
      driverPhone: '+234 806 000 0002',
      truckType: 'Flatbed Truck',
    ),
    ShipmentModel(
      tripId: 'TRP-2025-004',
      pickupLocation: 'Sabon Gari, Kano State',
      dropoffLocation: 'Kasuwan Barchi, Kaduna',
      weightKg: 2000,
      amount: 38000,
      currency: 'NGN',
      goodsDescription: 'Groundnut Oil (Drums)',
      pickupTime: DateTime.now().add(const Duration(hours: 5)),
      status: 'Pending',
    ),
    ShipmentModel(
      tripId: 'TRP-2025-005',
      pickupLocation: 'Apapa Port, Lagos',
      dropoffLocation: 'Asaba, Delta State',
      weightKg: 3500,
      amount: 95000,
      currency: 'NGN',
      goodsDescription: 'Industrial Machinery Parts',
      pickupTime: DateTime.now().subtract(const Duration(hours: 6)),
      status: 'In Transit',
      driverName: 'Mohammed Bello',
      driverPhone: '+234 805 000 0003',
      truckType: 'Heavy Duty Truck',
    ),
  ];

  static Future<UserModel> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 1200));

    // Role detection: 'driver' in email → driver role, else shipper
    final role = email.toLowerCase().contains('driver') ? 'driver' : 'shipper';
    final name = role == 'driver' ? 'Emmanuel Adaora' : 'Kelechi Obioma';

    return UserModel(
      id: 'usr_${role}_001',
      name: name,
      email: email,
      phone: '+234 801 234 5678',
      role: role,
    );
  }

  static Future<UserModel> register(
    String name,
    String email,
    String phone,
    String password,
    String role,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1800));

    return UserModel(
      id: 'usr_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      phone: phone,
      role: role.toLowerCase(),
    );
  }

  static Future<List<ShipmentModel>> getShipmentsForUser(
    String userId,
    String role,
  ) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return mockShipments;
  }

  static Future<ShipmentModel> saveShipment(ShipmentModel shipment) async {
    await Future.delayed(const Duration(milliseconds: 1500));
    mockShipments.insert(0, shipment);
    return shipment;
  }
}
