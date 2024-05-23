import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/default_button.dart';
import '../../common/component/divider_container.dart';
import '../../common/component/show/show_cupertino_alert.dart';
import '../../common/component/show/show_custom_toast.dart';
import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';
import '../../order/view/create_order_screen.dart';
import '../../product/component/product_and_amount_card.dart';
import '../../product/view/product_screen.dart';
import '../provider/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  static String get routeName => 'cart';

  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final carts = ref.watch(cartProvider);
    final isAllSelected =
        carts.firstWhereOrNull((element) => !element.isSelected) == null;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '장바구니'),
      bottomNavigationBar: carts.isNotEmpty
          ? Padding(
              padding:
                  const EdgeInsets.only(bottom: 20.0, left: 24.0, right: 24.0),
              child: Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        // ref
                        //     .read(orderProvider.notifier)
                        //     .addProductsFromCarts(carts: carts);
                        context.pushNamed(CreateOrderScreen.routeName);
                      },
                      child: Text(
                        '${DataUtils.convertPriceToMoneyString(
                          price: carts.map((e) {
                            return e.amount *
                                (e.product.price *
                                    (100 - e.product.sale) ~/
                                    100);
                          }).reduce((value, element) => value + element),
                        )} 원 주문하기',
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox(height: 0.0),
      child: carts.isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          ref
                              .read(cartProvider.notifier)
                              .updateAllSelected(isSelected: !isAllSelected);
                        },
                        child: Row(
                          children: [
                            (isAllSelected)
                                ? PhosphorIcon(
                                    PhosphorIcons.checkSquare(
                                      PhosphorIconsStyle.fill,
                                    ),
                                    color: MyColor.primary,
                                    size: 32.0,
                                  )
                                : PhosphorIcon(
                                    PhosphorIcons.square(),
                                    color: MyColor.text,
                                    size: 32.0,
                                  ),
                            const SizedBox(width: 8.0),
                            const Text(
                              '전체 선택',
                              style: MyTextStyle.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showCustomCupertinoAlert(
                            context: context,
                            titleWidget: const Text('상품을 삭제하시겠습니까?'),
                            completeText: '삭제하기',
                            completeFunction: () {
                              ref
                                  .read(cartProvider.notifier)
                                  .removeAllSelectedProduct();

                              showCustomToast(context, msg: '상품을 삭제했습니다.');
                              context.pop();
                            },
                            cancelText: '취소',
                            cancelFunction: () {
                              context.pop();
                            },
                          );
                        },
                        child: const Text(
                          '선택 삭제',
                          style: MyTextStyle.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                const DividerContainer(),
                Expanded(
                  child: ListView.separated(
                    controller: scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    itemBuilder: (_, index) {
                      final cart = carts[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: IconButton(
                              onPressed: () {
                                ref.read(cartProvider.notifier).updateSelected(
                                      cartId: cart.id,
                                      isSelected: !cart.isSelected,
                                    );
                              },
                              icon: cart.isSelected
                                  ? PhosphorIcon(
                                      PhosphorIcons.checkSquare(
                                        PhosphorIconsStyle.fill,
                                      ),
                                      color: MyColor.primary,
                                    )
                                  : PhosphorIcon(PhosphorIcons.square()),
                              iconSize: 32.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24.0,
                            ),
                            child: ProductAndAmountCard(cart: cart),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Divider(
                          height: 40.0,
                          color: MyColor.middleGrey,
                        ),
                      );
                    },
                    itemCount: carts.length,
                  ),
                )
              ],
            )
          : Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 80.0),
                  const Text(
                    '장바구니에\n담긴 상품이 없습니다.',
                    style: MyTextStyle.headTitle,
                    textAlign: TextAlign.start,
                  ),
                  const Expanded(child: SizedBox(height: 1.0)),
                  PrimaryButton(
                    onPressed: () {
                      context.goNamed(ProductScreen.routeName);
                    },
                    child: const Text('상품 보러가기'),
                  )
                ],
              ),
            ),
    );
  }
}
