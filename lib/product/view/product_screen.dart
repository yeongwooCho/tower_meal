import 'package:flutter/material.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';

import '../../common/const/text_styles.dart';

class ProductScreen extends StatelessWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '상품 리스트'),
      child: Column(
        children: [
          const SizedBox(height: 60.0),
          const Text(
            '새로운 비밀번호를\n입력해 주세요.',
            style: MyTextStyle.headTitle,
          ),
        ],
      ),
    );
  }
}