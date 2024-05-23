import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tower_meal/cart/provider/cart_provider.dart';
import 'package:tower_meal/cart/view/cart_screen.dart';
import 'package:tower_meal/common/component/custom_drop_down_single.dart';
import 'package:tower_meal/common/const/image_path.dart';
import 'package:tower_meal/common/provider/global_provider.dart';
import 'package:tower_meal/product/component/horizontal_item_list.dart';
import 'package:tower_meal/product/provider/product_provider.dart';
import 'package:tower_meal/second/home/view/second_home_screen.dart';

import '../../common/const/colors.dart';
import '../../common/const/data.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class HomeScreen extends ConsumerWidget {
  static String get routeName => "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productRandomProvider);
    final carts = ref.watch(cartProvider);
    final rootTabVersion = ref.watch(rootTabVersionProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '',
        titleWidget: AnimatedToggleSwitch<int>.rolling(
          current: rootTabVersion,
          values: const [0, 1],
          height: 40.0,
          onChanged: (int value) {
            ref.read(rootTabVersionProvider.notifier).update((state) => value);

            if (value == 0) {
              context.goNamed(HomeScreen.routeName);
            } else {
              context.goNamed(SecondHomeScreen.routeName);
            }
          },

          iconList: [
            Text(
              '쇼핑몰',
              style: MyTextStyle.minimumRegular.copyWith(
                color: MyColor.primary,
              ),
            ),
            Text(
              '브랜딩',
              style: MyTextStyle.minimumRegular.copyWith(
                color: MyColor.white,
              ),
            ),
          ],
          style: const ToggleStyle(
            backgroundColor: MyColor.secondary,
            indicatorColor: MyColor.white,
            borderColor: MyColor.empty,
          ), // optional style settings
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Image.asset(ImagePath.logoWhite),
        ),
        leadingWidth: 120,
        backgroundColor: MyColor.primary,
        foregroundColor: MyColor.white,
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
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImagePath.banner),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Row(
                children: [
                  Text(
                    '오늘은',
                    style: MyTextStyle.bigTitleBold,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: 100.0,
                      child: CustomSingleDropDown(
                        dropdownList: ['단', '신', '짠', '쓴', '감칠', '매운'],
                        hintText: '어떤',
                        onChanged: (String value) {},
                        dropdownHeight: 290.0,
                      ),
                    ),
                  ),
                  Text(
                    '맛이 땡긴다!',
                    style: MyTextStyle.bigTitleBold,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            HorizontalItemList(products: products),
            const SizedBox(height: 40.0),
            Image.asset(ImagePath.bannerBand),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '인기 상품',
                    style: MyTextStyle.bigTitleBold,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '더보기',
                      style: MyTextStyle.descriptionRegular.copyWith(
                        color: MyColor.darkGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            HorizontalItemList(products: products),
            const SizedBox(height: 40.0),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.lightGrey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final title = footerData[index];

            return Text(
              title,
              style: (index == 0)
                  ? MyTextStyle.minimumRegular.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MyColor.darkGrey,
                    )
                  : MyTextStyle.minimumRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 4.0);
          },
          itemCount: footerData.length,
        ),
      ),
    );
  }
}
