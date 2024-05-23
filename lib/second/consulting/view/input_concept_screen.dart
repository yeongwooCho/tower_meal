import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tower_meal/common/component/custom_drop_down_single.dart';
import 'package:tower_meal/common/component/custom_ink_well_button.dart';
import 'package:tower_meal/common/component/default_button.dart';
import 'package:tower_meal/common/const/text_styles.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';
import 'package:tower_meal/product/provider/category_provider.dart';
import 'package:tower_meal/second/consulting/view/result_concept_screen.dart';

class InputConceptScreen extends ConsumerStatefulWidget {
  static String get routeName => "input_concept";

  const InputConceptScreen({super.key});

  @override
  ConsumerState<InputConceptScreen> createState() => _InputConceptScreenState();
}

class _InputConceptScreenState extends ConsumerState<InputConceptScreen> {
  String productInfo = '';
  String targetAge = '';

  bool? isGender;
  String? incomeLevel;

  final List<String> brandValues = [
    '신선한 재료',
    '정확한 비율',
    '쉬운 재료',
    '편의성',
    '고품질',
    '혁신',
    '맞춤',
    '기타',
  ];
  List<String> selectedBrandValues = [];

  final List<String> positions = [
    '가격우선',
    '품질우선',
    '편의성',
    '전문성',
    '고급화',
    '홈파티',
    '기타',
  ];
  List<String> selectedPositions = [];

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '컨셉/브랜드 기획'),
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
              CustomSingleDropDown(
                dropdownList: categories,
                hintText: '제품 조리 구분',
                onChanged: (String value) {
                  setState(() {
                    productInfo = value;
                  });
                },
                dropdownHeight: 220.0,
              ),
              const SizedBox(height: 32.0),
              const Text(
                '타겟 나이',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              CustomSingleDropDown(
                dropdownList: ['10대', '20대', '30대', '40대', '50대', '60대 이상'],
                hintText: '나이',
                onChanged: (String value) {
                  setState(() {
                    targetAge = value;
                  });
                },
                dropdownHeight: 220.0,
              ),
              const SizedBox(height: 32.0),
              const Text(
                '성별',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: CustomInkWellButton(
                      title: '남자',
                      onTap: () {
                        setState(() {
                          isGender = true;
                        });
                      },
                      isSelected: isGender != null && isGender!,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: CustomInkWellButton(
                      title: '여자',
                      onTap: () {
                        setState(() {
                          isGender = false;
                        });
                      },
                      isSelected: isGender != null && !(isGender!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              const Text(
                '타겟 소득 수준',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: CustomInkWellButton(
                      title: '상',
                      onTap: () {
                        setState(() {
                          incomeLevel = '상';
                        });
                      },
                      isSelected: incomeLevel != null && incomeLevel == '상',
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: CustomInkWellButton(
                      title: '중',
                      onTap: () {
                        setState(() {
                          incomeLevel = '중';
                        });
                      },
                      isSelected: incomeLevel != null && incomeLevel == '중',
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: CustomInkWellButton(
                      title: '하',
                      onTap: () {
                        setState(() {
                          incomeLevel = '하';
                        });
                      },
                      isSelected: incomeLevel != null && incomeLevel == '하',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              const Text(
                '가치(최대 3개)',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: brandValues
                    .map((e) => CustomInkWellButton(
                          title: e,
                          onTap: () {
                            if (selectedBrandValues.contains(e)) {
                              selectedBrandValues.remove(e);
                            } else if (selectedBrandValues.length < 3) {
                              {
                                selectedBrandValues.add(e);
                              }
                            }
                            setState(() {});
                          },
                          isSelected: selectedBrandValues.contains(e),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 32.0),
              const Text(
                '포지션(최대 3개)',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: positions
                    .map((e) => CustomInkWellButton(
                          title: e,
                          onTap: () {
                            if (selectedPositions.contains(e)) {
                              selectedPositions.remove(e);
                            } else if (selectedPositions.length < 3) {
                              {
                                selectedPositions.add(e);
                              }
                            }
                            setState(() {});
                          },
                          isSelected: selectedPositions.contains(e),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 40.0),
              PrimaryButton(
                onPressed: () {
                  context.goNamed(ResultConceptScreen.routeName);
                },
                child: const Text('결과보기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
