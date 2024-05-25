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
  return pairProducts.take(4).toList();
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
      '프레쉬 샐러드 보울': 9300,
      '야외 핫팟 피에스타': 8700,
      "프레쉬 야채 플래터": 13400,
      "헬시 믹스 샐러드": 11480,
      "비타민 가득 샐러드": 9300,
      "그릴드 치킨 닭가슴살 샐러드": 7300,
      "신선한 샐러드 보울": 8400,
      "허브 비프 스튜": 10200,
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
        isLike: false,
        categoryIds: [1, 2, 3],
      ),
    );
  }
}
