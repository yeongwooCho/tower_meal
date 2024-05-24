class ConceptModel {
  final String productInfo;
  final String targetAge;
  final String gender;
  final String incomeLevel;
  final List<String> brandValues;
  final List<String> positions;

  ConceptModel({
    required this.productInfo,
    required this.targetAge,
    required this.gender,
    required this.incomeLevel,
    required this.brandValues,
    required this.positions,
  });

  ConceptModel copyWith({
    String? productInfo,
    String? targetAge,
    String? gender,
    String? incomeLevel,
    List<String>? brandValues,
    List<String>? positions,
  }) {
    return ConceptModel(
      productInfo: productInfo ?? this.productInfo,
      targetAge: targetAge ?? this.targetAge,
      gender: gender ?? this.gender,
      incomeLevel: incomeLevel ?? this.incomeLevel,
      brandValues: brandValues ?? this.brandValues,
      positions: positions ?? this.positions,
    );
  }
}
