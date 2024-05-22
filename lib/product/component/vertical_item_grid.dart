import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';
import '../model/product_model.dart';
import '../view/product_detail_screen.dart';

class VerticalItemList extends StatelessWidget {
  final List<ProductModel> products;

  const VerticalItemList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    const double itemSpacing = 16.0;
    const double horizontalPadding = 24.0;
    final double itemWidth = (MediaQuery.of(context).size.width -
            (horizontalPadding * 2) -
            itemSpacing) /
        2;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: horizontalPadding,
      ),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: itemWidth / (itemWidth + 80), // / 1,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];

        return GestureDetector(
          onTap: () {
            context.pushNamed(
              ProductDetailScreen.routeName,
              pathParameters: {'id': product.id.toString()},
            );
          },
          child: SizedBox(
            width: itemWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  product.mainImageUrl,
                  fit: BoxFit.cover,
                  height: itemWidth,
                ),
                const SizedBox(height: 4.0),
                Text(
                  product.name,
                  style: MyTextStyle.descriptionRegular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4.0),
                Text(
                  '${DataUtils.convertPriceToMoneyString(price: product.price)} 원',
                  style: MyTextStyle.bodyBold,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
