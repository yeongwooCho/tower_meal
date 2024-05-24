import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tower_meal/common/component/default_button.dart';
import 'package:tower_meal/common/const/image_path.dart';
import 'package:tower_meal/common/const/text_styles.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';
import 'package:tower_meal/second/consulting/view/offline_consulting_screen.dart';
import 'package:tower_meal/second/consulting/view/online_consulting_screen.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '상품 컨셉 / 기획안',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              _renderTitleAndDescription(
                title: '상품 이름',
                description: '"마스터 한상" (Master Hansang)',
              ),
              _renderTitleAndDescription(
                title: '상품 설명',
                description:
                    "마스터 한상'은 전문 쉐프의 레시피를 바탕으로 한 정통 한식 밀키트로, 바쁜 현대 생활 속에서도 누구나 쉽게 집에서 고급 한식을 즐길 수 있게 해줍니다. 신선한 재료와 철저한 품질 관리로 고객의 건강을 최우선으로 생각합니다.",
              ),
              _renderTitleAndDescription(
                title: '상품 구성 예시',
                description:
                    '갈비찜, 불고기, 제육볶음 등의 메인 요리와 함께 기본 반찬 세 가지, 향신료 및 소스, 조리법 설명서.',
              ),
              _renderTitleAndDescription(
                title: '포장 내용',
                description:
                    '환경 친화적인 소재의 우아한 포장, 메뉴별로 개별 포장된 재료, 재활용 가능한 아이스팩, QR 코드가 인쇄된 조리법 카드(스마트폰으로 스캔 가능).',
              ),
              const SizedBox(height: 40.0),
              const Text(
                '브랜딩 메세지',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Text(
                "당신의 집을 고급 한식당으로 변모시켜 드립니다. '마스터 한상'과 함께라면, 집에서도 전문가의 손길을 느낄 수 있습니다. 모든 재료는 최상의 품질만을 고집하며, 신선함을 그대로 전달해 드립니다. 바쁜 일상 속 짧은 시간에도 풍성한 한상을 즐겨보세요.",
                style: MyTextStyle.descriptionRegular,
              ),
              const SizedBox(height: 40.0),
              const Text(
                '디자인 아이디어',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Image.asset(
                ImagePath.concept,
                width: double.infinity,
              ),
              const SizedBox(height: 8.0),
              _renderTitleAndDescription(
                title: '로고 디자인',
                description: '간결하고 세련된 서체 사용, 전통 한식 요리의 모습을 추상화한 심볼 포함.',
              ),
              _renderTitleAndDescription(
                title: '상품 구성 예시',
                description:
                    "천연 느낌의 갈색과 녹색 조합, 음식 사진보다는 그림 또는 수채화로 음식을 표현하여 고급스러움과 전문성 강조. 메뉴별로 색상 코드를 다르게 하여 식별 용이.",
              ),
              _renderTitleAndDescription(
                title: '웹사이트 및 SNS 디자인',
                description:
                    '고해상도의 실제 조리 완성품 사진, 쉐프와의 인터뷰 비디오, 조리 과정 설명 동영상 등을 포함하여 전문성과 품질을 강조.',
              ),
              const SizedBox(height: 40.0),
              const Text(
                'SWOT 분석',
                style: MyTextStyle.bodyTitleMedium,
              ),
              _renderTitleAndDescription(
                title: 'Strengths\n(강점)',
                description:
                    '신선한 재료 사용, 전문 쉐프의 레시피, 고품질 조리 경험 제공, 특정 타겟 고객(40대 남성)에 맞춘 제품.',
              ),
              _renderTitleAndDescription(
                title: 'Weaknesses\n(약점)',
                description: "초기 브랜드 인지도 부족, 상대적으로 높은 가격 설정, 한정된 타겟 고객층.",
              ),
              _renderTitleAndDescription(
                title: 'Opportunities\n(기회)',
                description:
                    '홈파티 및 건강식에 대한 관심 증가, 온라인 쇼핑 및 홈쿠킹 트렌드 성장, 소셜 미디어 마케팅을 통한 브랜드 홍보.',
              ),
              _renderTitleAndDescription(
                title: 'Threats\n(위협)',
                description: '유사한 밀키트 제품과의 경쟁, 경기 불황에 따른 소비 위축, 원자재 가격의 변동성.',
              ),
              const SizedBox(height: 40.0),
              Row(
                children: [
                  Expanded(
                    child: SecondaryButton(
                      onPressed: () {
                        context.goNamed(OfflineConsultingScreen.routeName);
                      },
                      child: const Text('오프라인 컨설팅'),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        context.goNamed(OnlineConsultingScreen.routeName);
                      },
                      child: const Text('온라인 컨설팅'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
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
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(
              title,
              style: MyTextStyle.descriptionMedium,
              textAlign: TextAlign.start,
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
}
