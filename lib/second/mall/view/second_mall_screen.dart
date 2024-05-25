import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tower_meal/common/component/default_button.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';
import 'package:tower_meal/mall/view/mall_screen.dart';

import '../../../common/const/text_styles.dart';

class SecondMallScreen extends StatelessWidget {
  static String get routeName => "second_mall";

  const SecondMallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '도매몰'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '현재 도매몰은\n서비스 준비중입니다.',
              style: MyTextStyle.headTitle,
            ),
            PrimaryButton(
              onPressed: () {
                context.goNamed(MallScreen.routeName);
              },
              child: const Text('브랜딩 홈으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
