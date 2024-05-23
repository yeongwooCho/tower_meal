import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tower_meal/common/component/default_button.dart';
import 'package:tower_meal/common/const/text_styles.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';

class ResultConceptScreen extends ConsumerWidget {
  static String get routeName => "result_concept";

  const ResultConceptScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '컨셉/브랜드 기획 결과'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '제품 정보',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              PrimaryButton(
                onPressed: () {},
                child: const Text('결과보기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
