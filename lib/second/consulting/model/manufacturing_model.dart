class ManufacturingModel {
  final String targetLocation;
  final String circulation;
  final String supplier;
  final int estimatedManufacturingCost;
  final int estimatedManufacturingPeriod;

  ManufacturingModel({
    required this.targetLocation,
    required this.circulation,
    required this.supplier,
    required this.estimatedManufacturingCost,
    required this.estimatedManufacturingPeriod,
  });

  ManufacturingModel copyWith({
    String? targetLocation,
    String? circulation,
    String? supplier,
    int? estimatedManufacturingCost,
    int? estimatedManufacturingPeriod,
  }) {
    return ManufacturingModel(
      targetLocation: targetLocation ?? this.targetLocation,
      circulation: circulation ?? this.circulation,
      supplier: supplier ?? this.supplier,
      estimatedManufacturingCost:
          estimatedManufacturingCost ?? this.estimatedManufacturingCost,
      estimatedManufacturingPeriod:
          estimatedManufacturingPeriod ?? this.estimatedManufacturingPeriod,
    );
  }
}
