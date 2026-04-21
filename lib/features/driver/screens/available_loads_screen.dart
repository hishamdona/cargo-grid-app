import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';
import '../../../providers/shipment_provider.dart';
import '../../../core/widgets/driver_load_card.dart';

class AvailableLoadsScreen extends StatefulWidget {
  const AvailableLoadsScreen({super.key});

  @override
  State<AvailableLoadsScreen> createState() => _AvailableLoadsScreenState();
}

class _AvailableLoadsScreenState extends State<AvailableLoadsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = Provider.of<AuthProvider>(context, listen: false).user;
      if (user != null) {
        Provider.of<ShipmentProvider>(
          context,
          listen: false,
        ).fetchShipments(user.id, user.role);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final shipmentProvider = Provider.of<ShipmentProvider>(context);
    // For prototype, show pending shipments as available loads
    final availableLoads = shipmentProvider.getShipmentsByStatus('Pending');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Loads'),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: shipmentProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : availableLoads.isEmpty
          ? const Center(child: Text('No loads available at the moment.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: availableLoads.length,
              itemBuilder: (context, index) {
                final shipment = availableLoads[index];
                return DriverLoadCard(
                  shipment: shipment,
                  onAccept: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Accepted load ${shipment.tripId}'),
                      ),
                    );
                  },
                  onDecline: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Declined load ${shipment.tripId}'),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
