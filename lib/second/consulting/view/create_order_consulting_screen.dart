import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common/component/default_button.dart';
import '../../../common/component/divider_container.dart';
import '../../../common/const/text_styles.dart';
import '../../../common/layout/default_app_bar.dart';
import '../../../common/layout/default_layout.dart';
import '../../../common/view/completion_screen.dart';
import '../../../order/component/delivery_info.dart';
import '../../../order/component/order_info.dart';
import '../../../order/component/toss_payment_container.dart';
import '../../../user/model/user_model.dart';
import '../../../user/provider/user_provider.dart';

class CreateOrderConsultingScreen extends ConsumerStatefulWidget {
  static String get routeName => 'create_order_consulting';

  const CreateOrderConsultingScreen({super.key});

  @override
  ConsumerState<CreateOrderConsultingScreen> createState() =>
      _CreateOrderConsultingScreenState();
}

class _CreateOrderConsultingScreenState
    extends ConsumerState<CreateOrderConsultingScreen> {
  bool isLoading = false;
  int productPrice = 150000;
  int totalPrice = 125000;
  int discountPrice = 0;

  String cardName = ''; // 카드사 이름

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider) as UserModel;

    discountPrice = productPrice - totalPrice;

    return DefaultLayout(
      isLoading: isLoading,
      appbar: const DefaultAppBar(title: '주문/결제'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '상품 정보',
                    style: MyTextStyle.bigTitleBold,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '컨셉 브랜딩 온라인 컨설팅',
                    style: MyTextStyle.descriptionRegular,
                  ),
                ],
              ),
            ),
            const DividerContainer(),
            OrderInfo(
              user: user,
              productPrice: productPrice,
              discountPrice: discountPrice,
              totalPrice: totalPrice,
            ),
            const DividerContainer(),
            DeliveryInfo(address: user.address),
            const DividerContainer(),
            TossPaymentContainer(
              onChanged: (value) {
                cardName = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PrimaryButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() {
                    isLoading = false;
                  });

                  context.goNamed(
                    CompletionScreen.routeName,
                    pathParameters: {'title': '결제가\n정상적으로\n완료되었습니다.'},
                  );
                },
                child: const Text('결제하기'),
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
