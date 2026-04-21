import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/shipment_provider.dart';
import '../../../core/widgets/shipment_card.dart';
import '../../../core/theme/app_colors.dart';

class ShipmentsScreen extends StatelessWidget {
  const ShipmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shipmentProvider = Provider.of<ShipmentProvider>(context);
    final shipments = shipmentProvider.shipments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shipments'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: DefaultTabController(
            length: 4,
            child: Container(
              color: AppColors.background,
              child: const TabBar(
                isScrollable: true,
                indicatorColor: AppColors.primary,
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.textSecondary,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Pending'),
                  Tab(text: 'In Transit'),
                  Tab(text: 'Delivered'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: shipmentProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : shipments.isEmpty
          ? const Center(child: Text('You have no shipments.'))
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: shipments.length,
              itemBuilder: (context, index) {
                final shipment = shipments[index];
                return ShipmentCard(
                  shipment: shipment,
                  onTap: () {
                    // Navigate to detail
                  },
                );
              },
            ),
    );
  }
}
