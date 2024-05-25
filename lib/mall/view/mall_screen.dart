import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tower_meal/common/component/default_button.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';
import 'package:tower_meal/second/home/view/second_home_screen.dart';

import '../../common/const/text_styles.dart';

class MallScreen extends StatelessWidget {
  static String get routeName => "mall";

  const MallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '도매 mall'),
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
                context.goNamed(SecondHomeScreen.routeName);
              },
              child: const Text('브랜딩 홈으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
