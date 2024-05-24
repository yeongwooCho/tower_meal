import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tower_meal/common/component/default_button.dart';
import 'package:tower_meal/common/const/text_styles.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';
import 'package:tower_meal/common/view/completion_screen.dart';

class OfflineConsultingScreen extends StatelessWidget {
  static String get routeName => 'offline_consulting';

  const OfflineConsultingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '오프라인 컨설팅'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '매칭된 컨설팅 전문가가\n고객님의 연락처로 연락 드릴 예정입니다.\n\n신청을 원하시면 신청을 눌러주세요.',
              style: MyTextStyle.bodyTitleMedium,
            ),
            const SizedBox(height: 60.0),
            PrimaryButton(
              onPressed: () {
                context.goNamed(
                  CompletionScreen.routeName,
                  pathParameters: {
                    'title': '오프라인 컨설팅 신청이\n완료되었습니다.',
                  },
                );
              },
              child: const Text('신청하기'),
            ),
          ],
        ),
      ),
    );
  }
}
