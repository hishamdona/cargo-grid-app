import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/shipment_provider.dart';

import '../../../core/widgets/golden_button.dart';
import '../../../core/theme/app_colors.dart';

class ActiveTripsScreen extends StatelessWidget {
  const ActiveTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shipmentProvider = Provider.of<ShipmentProvider>(context);
    final inTransitLoads = shipmentProvider.getShipmentsByStatus('In Transit');

    return Scaffold(
      appBar: AppBar(title: const Text('Active Trips')),
      body: shipmentProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : inTransitLoads.isEmpty
          ? const Center(child: Text('You have no active trips.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: inTransitLoads.length,
              itemBuilder: (context, index) {
                final shipment = inTransitLoads[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              shipment.tripId,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.statusInTransit.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Text(
                                'IN TRANSIT',
                                style: TextStyle(
                                  color: AppColors.statusInTransit,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'From: ${shipment.pickupLocation}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'To: ${shipment.dropoffLocation}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.navigation),
                                label: const Text('Navigate'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: GoldenButton(
                                text: 'Update Status',
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
