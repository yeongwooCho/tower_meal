import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hidable/hidable.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';
import 'package:tower_meal/product/provider/product_provider.dart';

import '../../common/component/default_button.dart';
import '../../common/component/divider_container.dart';
import '../../common/component/show/show_component_modal_bottom_sheet.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';
import '../component/purchase_modal_bottom_sheet.dart';
import '../component/rating_container.dart';
import '../component/vertical_item_grid.dart';
import '../model/product_model.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'product_detail';

  final int id;

  const ProductDetailScreen({
    super.key,
    required this.id,
  });

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  final ScrollController scrollController = ScrollController();
  int count = 1;

  @override
  Widget build(BuildContext context) {
    final product = ref.watch(productDetailProvider(widget.id));
    final productPrefer = ref.watch(productPreferProvider);

    final fullWidth = MediaQuery.of(context).size.width;
    final safeTopPadding = MediaQuery.of(context).padding.top;

    // final carts = ref.watch(cartProvider);

    return DefaultLayout(
      appbar: Hidable(
        preferredWidgetSize:
            Size.fromHeight(DefaultAppBar.defaultAppBarHeight + safeTopPadding),
        controller: scrollController,
        child: DefaultAppBar(
          title: '',
          action: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  // context.pushNamed(CartScreen.routeName);
                },
                icon: PhosphorIcon(
                  PhosphorIcons.shoppingCart(),
                  size: 28.0,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Hidable(
        controller: scrollController,
        preferredWidgetSize: const Size.fromHeight(68),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    width: 1.0,
                    color: MyColor.middleGrey,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    ref.read(productProvider.notifier).updateLike(
                          productId: product.id,
                          isLike: !product.isLike,
                        );
                  },
                  icon: product.isLike
                      ? PhosphorIcon(
                          PhosphorIcons.heart(PhosphorIconsStyle.fill),
                          color: MyColor.error,
                          size: 32.0,
                        )
                      : PhosphorIcon(
                          PhosphorIcons.heart(),
                          color: MyColor.middleGrey,
                          size: 32.0,
                        ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: PrimaryButton(
                  onPressed: () {
                    showCustomModalBottomSheet(
                      context: context,
                      bottomSheetWidget: PurchaseModalBottomSheet(
                        product: product,
                      ),
                    );
                  },
                  child: const Text('구매하기'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              product.mainImageUrl,
              width: fullWidth,
              height: fullWidth,
              fit: BoxFit.fitWidth,
            ),
            renderProductInfo(product: product),
            const DividerContainer(),
            renderDescriptionImages(detailImages: product.detailImageUrls),
            const SizedBox(height: 40.0),
            const DividerContainer(),
            RatingContainer(),
            const DividerContainer(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0),
              child: Text(
                '연관 상품 추천',
                style: MyTextStyle.bigTitleMedium,
              ),
            ),
            VerticalItemList(products: productPrefer)
          ],
        ),
      ),
    );
  }

  Widget renderProductInfo({
    required ProductModel product,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            product.name,
            style: MyTextStyle.bodyTitleMedium,
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '${product.sale}%',
                style: MyTextStyle.bigTitleBold.copyWith(
                  color: MyColor.heart,
                ),
              ),
              const SizedBox(width: 16.0),
              Text(
                '${DataUtils.convertPriceToMoneyString(price: product.price * (100 - product.sale) ~/ 100)} 원',
                style: MyTextStyle.bigTitleBold,
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            '${DataUtils.convertPriceToMoneyString(price: product.price)} 원',
            style: MyTextStyle.bodyRegular.copyWith(
              color: MyColor.darkGrey,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }

  Widget renderDescriptionImages({
    required List<String> detailImages,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0, top: 40.0, bottom: 8.0),
          child: Text(
            '상품 정보',
            style: MyTextStyle.bigTitleMedium,
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: detailImages.length,
          itemBuilder: (context, index) {
            return Container(
              color: MyColor.darkGrey,
              child: Image.asset(
                detailImages[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ],
    );
  }
}
