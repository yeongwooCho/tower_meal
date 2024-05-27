import 'package:flutter/cupertino.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(ImagePath.serviceImage),
            ),
            const SizedBox(height: 20.0),
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
