import 'package:flutter/foundation.dart';
import '../models/shipment_model.dart';
import '../services/shipment_service.dart';

class ShipmentProvider extends ChangeNotifier {
  final ShipmentService _shipmentService = ShipmentService();

  List<ShipmentModel> _shipments = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ShipmentModel> get shipments => _shipments;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchShipments(String userId, String role) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _shipments = await _shipmentService.getShipments(userId, role);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString();
      notifyListeners();
    }
  }

  // Helper to get shipments by status
  List<ShipmentModel> getShipmentsByStatus(String status) {
    return _shipments
        .where((s) => s.status.toLowerCase() == status.toLowerCase())
        .toList();
  }
}
