import 'package:flutter/material.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';

import '../../common/const/text_styles.dart';

class MallScreen extends StatelessWidget {
  static String get routeName => "mall";

  const MallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '도매 mall'),
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
