import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';
import 'package:tower_meal/product/component/vertical_item_grid.dart';
import 'package:tower_meal/product/provider/category_provider.dart';
import 'package:tower_meal/product/provider/product_provider.dart';

import '../../cart/provider/cart_provider.dart';
import '../../cart/view/cart_screen.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';

class ProductScreen extends ConsumerWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);
    final categories = ref.watch(categoriesProvider);
    final selectedCategory = ref.watch(categorySelectedProvider);
    final randomProducts = ref.watch(productRandomProvider);

    final carts = ref.watch(cartProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '상품 리스트',
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                context.pushNamed(CartScreen.routeName);
              },
              icon: badges.Badge(
                showBadge: carts.isNotEmpty,
                badgeContent: Text(
                  carts.length.toString(),
                  style: MyTextStyle.minimumRegular.copyWith(
                    color: MyColor.white,
                    height: 1.0,
                  ),
                ),
                child: PhosphorIcon(
                  PhosphorIcons.shoppingCart(),
                  size: 28.0,
                ),
              ),
            ),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 84.0,
            child: ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                final category = categories[index];

                return Container(
                  decoration: BoxDecoration(
                    color:
                        selectedCategory == category ? MyColor.primary : null,
                    border: Border.all(
                      width: 1.0,
                      color: selectedCategory == category
                          ? MyColor.empty
                          : MyColor.middleGrey,
                    ),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      ref.read(categorySelectedProvider.notifier).state =
                          category;
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        category,
                        style: MyTextStyle.bodyRegular.copyWith(
                          color: selectedCategory == category
                              ? MyColor.white
                              : null,
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 8.0);
              },
              itemCount: categories.length,
            ),
          ),
          Expanded(
            child: VerticalItemList(
                products: selectedCategory == categories.first
                    ? products
                    : randomProducts),
          ),
        ],
      ),
    );
  }
}
