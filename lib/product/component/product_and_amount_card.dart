import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../cart/model/cart_model.dart';
import '../../cart/provider/cart_provider.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/utils/data_utils.dart';

class ProductAndAmountCard extends ConsumerWidget {
  final CartModel cart;
  final bool isFixed;

  const ProductAndAmountCard({
    super.key,
    required this.cart,
    this.isFixed = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Image.asset(
                cart.product.mainImageUrl,
                width: 120.0,
                height: 120.0,
              ),
              const SizedBox(width: 12.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cart.product.name,
                    style: MyTextStyle.bodyRegular,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${DataUtils.convertPriceToMoneyString(
                          price: cart.product.price *
                              (100 - cart.product.sale) ~/
                              100,
                        )} 원",
                        style: MyTextStyle.bigTitleBold,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '${DataUtils.convertPriceToMoneyString(
                          price: cart.product.price,
                        )} 원',
                        style: MyTextStyle.descriptionRegular.copyWith(
                          decoration: TextDecoration.lineThrough,
                          color: MyColor.darkGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  if (isFixed)
                    Text(
                      '수량: ${cart.amount}개',
                      style: MyTextStyle.bodyRegular,
                    ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        if (!isFixed)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '수량 선택',
                style: MyTextStyle.bodyMedium,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (cart.amount > 1) {
                        ref.read(cartProvider.notifier).updateAmount(
                              cartId: cart.id,
                              amount: cart.amount - 1,
                            );
                      }
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: MyColor.middleGrey,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhosphorIcon(
                          PhosphorIcons.minus(),
                          size: 20.0,
                          color: MyColor.text,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    cart.amount.toString(),
                    style: MyTextStyle.bigTitleRegular,
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(cartProvider.notifier).updateAmount(
                            cartId: cart.id,
                            amount: cart.amount + 1,
                          );
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: MyColor.middleGrey,
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PhosphorIcon(
                          PhosphorIcons.plus(),
                          size: 20.0,
                          color: MyColor.text,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
      ],
    );
  }
}
