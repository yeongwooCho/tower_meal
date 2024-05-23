
import 'package:flutter/material.dart';
import 'package:tower_meal/common/component/default_button.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';

import '../../../common/const/text_styles.dart';


class SecondConsultingScreen extends StatelessWidget {
  static String get routeName => "second_consulting";

  const SecondConsultingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '컨설팅'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '컨설팅',
              style: MyTextStyle.headTitle,
            ),
            PrimaryButton(
              onPressed: () {},
              child: const Text('브랜딩 홈으로 이동'),
            ),
          ],
        ),
      ),
    );
  }
}
