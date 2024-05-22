import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tower_meal/common/utils/data_utils.dart';
import 'package:tower_meal/product/model/product_model.dart';
import 'package:tower_meal/product/provider/category_provider.dart';

final productRandomProvider = Provider<List<ProductModel>>((ref) {
  final products = ref.watch(productProvider);
  final selectedCategory = ref.watch(categorySelectedProvider);

  final randomProducts =
      DataUtils.getRandomShuffledList<ProductModel>(products);
  return randomProducts;
});

final productPreferProvider = Provider<List<ProductModel>>((ref) {
  final products = ref.watch(productProvider);

  final pairProducts = DataUtils.getRandomShuffledList<ProductModel>(products);
  return pairProducts.take(2).toList();
});

final productDetailProvider = Provider.family<ProductModel, int>((ref, id) {
  final product =
      ref.watch(productProvider).firstWhere((element) => element.id == id);
  return product;
});

final productProvider =
    StateNotifierProvider<ProductStateNotifier, List<ProductModel>>((ref) {
  return ProductStateNotifier();
});

class ProductStateNotifier extends StateNotifier<List<ProductModel>> {
  ProductStateNotifier() : super([]) {
    state = getItems();
  }

  void updateLike({
    required int productId,
    required bool isLike,
  }) {
    state = state.map((element) {
      if (element.id == productId) {
        return element.copyWith(isLike: isLike);
      } else {
        return element;
      }
    }).toList();
  }

  List<ProductModel> getItems() {
    final products = {
      '치즈 왕관 팝콘': 4300,
      '꿀맛 크림 와퍼 샌드': 2700,
      "컬러풀 데일리 매크롱 세트": 3400,
      "골든 칩 크리스피 딜라이트": 1480,
      "컬러풀 캔디 트로피칼 믹스": 2300,
      "피트니스 고섬유 바": 5300,
      "초코칩 아이스크림 쿠키": 3400,
      "블랙 화이트 크림 샌드위치": 2200,
    };

    return List.generate(
      products.length,
      (index) => ProductModel(
        id: index,
        name: products.keys.toList()[index],
        price: products.values.toList()[index],
        sale: index + 10,
        mainImageUrl: 'asset/img/product/$index.png',
        detailImageUrls: [
          'asset/img/product/$index/0.png',
          'asset/img/product/$index/1.png',
          'asset/img/product/$index/2.png',
          'asset/img/product/$index/3.png',
        ],
        isLike: true,
        categoryIds: [1, 2, 3],
      ),
    );
  }
}
