
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tower_meal/common/component/default_button.dart';
import 'package:tower_meal/common/const/image_path.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';
import 'package:tower_meal/second/consulting/view/input_concept_screen.dart';

class SecondConsultingScreen extends StatelessWidget {
  static String get routeName => "second_consulting";

  const SecondConsultingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '컨셉/브랜드 기획'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImagePath.serviceImage),
            PrimaryButton(
              onPressed: () {
                context.pushNamed(InputConceptScreen.routeName);
              },
              child: const Text('컨설팅 시작하기'),
            ),
          ],
        ),
      ),
    );
  }
}