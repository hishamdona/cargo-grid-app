import '../models/shipment_model.dart';
import 'mock_data_service.dart';

class ShipmentService {
  Future<List<ShipmentModel>> getShipments(String userId, String role) async {
    try {
      return await MockDataService.getShipmentsForUser(userId, role);
    } catch (e) {
      throw Exception('Failed to fetch shipments. Please try again.');
    }
  }

  // Add more methods when a real API is connected
}
