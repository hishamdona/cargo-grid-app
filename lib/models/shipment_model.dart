class ShipmentModel {
  final String tripId;
  final String pickupLocation;
  final String dropoffLocation;
  final double weightKg;
  final double amount;
  final String currency;
  final String goodsDescription;
  final DateTime pickupTime;
  final String status;
  final String? driverName;
  final String? driverPhone;
  final String? truckType;

  ShipmentModel({
    required this.tripId,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.weightKg,
    required this.amount,
    this.currency = '₦',
    required this.goodsDescription,
    required this.pickupTime,
    required this.status,
    this.driverName,
    this.driverPhone,
    this.truckType,
  });

  factory ShipmentModel.fromJson(Map<String, dynamic> json) {
    return ShipmentModel(
      tripId: json['tripId'] as String,
      pickupLocation: json['pickupLocation'] as String,
      dropoffLocation: json['dropoffLocation'] as String,
      weightKg: (json['weightKg'] as num).toDouble(),
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? '₦',
      goodsDescription: json['goodsDescription'] as String,
      pickupTime: DateTime.parse(json['pickupTime'] as String),
      status: json['status'] as String,
      driverName: json['driverName'] as String?,
      driverPhone: json['driverPhone'] as String?,
      truckType: json['truckType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tripId': tripId,
      'pickupLocation': pickupLocation,
      'dropoffLocation': dropoffLocation,
      'weightKg': weightKg,
      'amount': amount,
      'currency': currency,
      'goodsDescription': goodsDescription,
      'pickupTime': pickupTime.toIso8601String(),
      'status': status,
      'driverName': driverName,
      'driverPhone': driverPhone,
      'truckType': truckType,
    };
  }
}
