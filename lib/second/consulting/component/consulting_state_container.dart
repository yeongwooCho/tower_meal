import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tower_meal/second/consulting/model/consulting_model.dart';
import 'package:tower_meal/second/consulting/provider/consulting_provider.dart';
import 'package:tower_meal/second/consulting/view/online_consulting_screen.dart';
import 'package:tower_meal/second/consulting/view/result_circulation_screen.dart';
import 'package:tower_meal/second/consulting/view/result_concept_screen.dart';
import 'package:tower_meal/second/consulting/view/second_consulting_screen.dart';

import '../../../common/component/default_button.dart';
import '../../../common/const/colors.dart';
import '../../../common/const/text_styles.dart';

class ConsultingStateContainer extends ConsumerWidget {
  const ConsultingStateContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final consulting = ref.watch(consultingProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '컨설팅 진행상태',
            style: MyTextStyle.bodyTitleMedium,
          ),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: MyColor.middleGrey,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: consulting.status == ConsultingStatus.no
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          '진행중인 컨설팅이 존재하지 않습니다.',
                          style: MyTextStyle.descriptionRegular,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16.0),
                        SecondaryButton(
                          onPressed: () {
                            routerByStatus(
                              context: context,
                              status: consulting.status,
                            );
                          },
                          child: const Text('Tower 브랜딩 컨설팅 받기'),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          consulting.status.label,
                          style: MyTextStyle.descriptionRegular,
                        ),
                        SecondaryButton(
                          onPressed: () {
                            routerByStatus(
                              context: context,
                              status: consulting.status,
                            );
                          },
                          child: const Text('상세보기'),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void routerByStatus({
    required BuildContext context,
    required ConsultingStatus status,
  }) {
    switch (status) {
      case ConsultingStatus.doingConcept:
        context.goNamed(SecondConsultingScreen.routeName);
      case ConsultingStatus.doneConcept:
        context.pushNamed(ResultConceptScreen.routeName);
      case ConsultingStatus.doingManufacture:
        context.pushNamed(OnlineConsultingScreen.routeName);
      case ConsultingStatus.doneManufacture:
        context.pushNamed(ResultCirculationScreen.routeName);
      default: // no
        context.goNamed(SecondConsultingScreen.routeName);
    }
  }
}
