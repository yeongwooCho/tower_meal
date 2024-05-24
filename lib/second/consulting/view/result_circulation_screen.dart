import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tower_meal/common/component/default_button.dart';
import 'package:tower_meal/common/const/colors.dart';
import 'package:tower_meal/common/const/image_path.dart';
import 'package:tower_meal/common/const/text_styles.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';
import 'package:tower_meal/second/consulting/view/create_order_consulting_screen.dart';

class ResultCirculationScreen extends StatelessWidget {
  static String get routeName => 'result_circulation';

  const ResultCirculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '제조/유통 결과'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '추천 제조공장',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Image.asset(ImagePath.map),
              const SizedBox(height: 40.0),
              _renderTitleAndDescriptionWidget(
                title: '제조공장\n이미지',
                descriptionWidget: Image.asset(ImagePath.manufacturing),
              ),
              _renderTitleAndDescription(
                title: '제조공장 명',
                description: '(주) 딜리버리테크',
              ),
              _renderTitleAndDescription(
                title: '제조공장\n대표번호',
                description: '02-8282-2345',
              ),
              _renderTitleAndDescription(
                title: '제조공장 주소',
                description: '서울특별시 종로구 세종대로 172',
              ),
              _renderTitleAndDescription(
                title: '위생',
                description: '대형 할인마트, 식자재 마트',
              ),
              _renderTitleAndDescriptionWidget(
                title: '평균 단가',
                descriptionWidget: Row(
                  children: List.generate(
                    5,
                    (index) => PhosphorIcon(
                      PhosphorIcons.star(PhosphorIconsStyle.fill),
                      color: MyColor.primary,
                    ),
                  ),
                ),
              ),
              _renderTitleAndDescriptionWidget(
                title: '평균 제조기간',
                descriptionWidget: Row(
                  children: List.generate(
                    5,
                    (index) => PhosphorIcon(
                      PhosphorIcons.star(PhosphorIconsStyle.fill),
                      color: MyColor.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              const Text(
                '추천 유통업체',
                style: MyTextStyle.bodyTitleMedium,
              ),
              _renderTitleAndDescriptionWidget(
                title: '유통사 이미지',
                descriptionWidget: Image.asset(ImagePath.circulation),
              ),
              _renderTitleAndDescription(
                title: '유통사 명',
                description: '(주) 딜리버리테크',
              ),
              _renderTitleAndDescription(
                title: '유통사\n대표번호',
                description: '02-8282-2345',
              ),
              _renderTitleAndDescription(
                title: '유통사 주소',
                description: '서울특별시 종로구 세종대로 172',
              ),
              _renderTitleAndDescription(
                title: '주요 유통라인',
                description: '대형 할인마트, 식자재 마트',
              ),
              _renderTitleAndDescription(
                title: '온라인\n지원여부',
                description: '가능',
              ),
              const SizedBox(height: 40.0),
              PrimaryButton(
                onPressed: () {
                  context.goNamed(CreateOrderConsultingScreen.routeName);
                },
                child: const Text('전문 컨설턴트에게 상담받고 싶어요!'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderTitleAndDescription({
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110.0,
            child: Text(
              title,
              style: MyTextStyle.descriptionMedium,
            ),
          ),
          Expanded(
            child: Text(
              description,
              style: MyTextStyle.descriptionRegular,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderTitleAndDescriptionWidget({
    required String title,
    required Widget descriptionWidget,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110.0,
            child: Text(
              title,
              style: MyTextStyle.descriptionMedium,
            ),
          ),
          Expanded(child: descriptionWidget),
        ],
      ),
    );
  }
}
