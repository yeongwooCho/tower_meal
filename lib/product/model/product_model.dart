class ProductModel {
  final int id;
  final String name;
  final int price;
  final int sale;
  final String mainImageUrl;
  final List<String> detailImageUrls;
  final bool isLike;
  final List<int> categoryIds;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.sale,
    required this.mainImageUrl,
    required this.detailImageUrls,
    required this.isLike,
    required this.categoryIds,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    int? price,
    int? sale,
    String? mainImageUrl,
    List<String>? detailImageUrls,
    bool? isLike,
    List<int>? categoryIds,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      sale: sale ?? this.sale,
      isLike: isLike ?? this.isLike,
      categoryIds: categoryIds ?? this.categoryIds,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      detailImageUrls: detailImageUrls ?? this.detailImageUrls,
    );
  }
}
