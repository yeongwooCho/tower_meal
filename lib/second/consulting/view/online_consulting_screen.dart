import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tower_meal/common/component/custom_text_form_field.dart';
import 'package:tower_meal/common/component/default_button.dart';
import 'package:tower_meal/common/const/colors.dart';
import 'package:tower_meal/common/const/text_styles.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/common/layout/default_layout.dart';
import 'package:tower_meal/kakao_address/compoenet/showKakaoAddress.dart';
import 'package:tower_meal/kakao_address/model/kakao_address_model.dart';
import 'package:tower_meal/kakao_address/provider/kakao_address_provider.dart';

import '../../../common/component/custom_ink_well_button.dart';

class OnlineConsultingScreen extends ConsumerStatefulWidget {
  static String get routeName => 'online_consulting';

  const OnlineConsultingScreen({super.key});

  @override
  ConsumerState<OnlineConsultingScreen> createState() =>
      _OnlineConsultingScreenState();
}

class _OnlineConsultingScreenState
    extends ConsumerState<OnlineConsultingScreen> {
  String? targetLocation; // 타겟 지역(온라인, 오프라인)
  String? circulation; // 유통(온라인, 오프라인)

  //address
  // String postCode = '';
  // String address = '주소 찾기';
  // String roadAddress = '';
  // String jibunAddress = '';
  // String region = '';
  // double latitude = 0.0;
  // double longitude = 0.0;

  final List<String> preferredSupplier = [
    '대형 할인마트',
    '식자재 마트',
    '중소형 마트',
    '편의점',
    '구내식당',
    '학교',
    '기타',
  ];
  String selectedSupplier = '';

  @override
  Widget build(BuildContext context) {
    final kakaoAddress = ref.watch(kakaoAddressProvider);

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
                '타겟 지역',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: CustomInkWellButton(
                      title: '온라인',
                      onTap: () {
                        setState(() {
                          targetLocation = '온라인';
                        });
                      },
                      isSelected:
                          targetLocation != null && targetLocation == '온라인',
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: CustomInkWellButton(
                      title: '오프라인',
                      onTap: () {
                        setState(() {
                          targetLocation = '오프라인';
                        });
                      },
                      isSelected:
                          targetLocation != null && targetLocation == '오프라인',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              InkWell(
                onTap: () {
                  onTapKakaoAddress(
                    context: context,
                    ref: ref,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.0,
                      color: MyColor.middleGrey,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: MyColor.empty,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (kakaoAddress is KakaoAddressModel)
                              ? kakaoAddress.address
                              : '주소 검색',
                          style: MyTextStyle.bodyRegular.copyWith(
                            color: (kakaoAddress is KakaoAddressModel)
                                ? MyColor.text
                                : MyColor.darkGrey,
                          ),
                        ),
                        PhosphorIcon(PhosphorIcons.caretRight())
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              const Text(
                '유통',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: CustomInkWellButton(
                      title: '온라인',
                      onTap: () {
                        setState(() {
                          circulation = '온라인';
                        });
                      },
                      isSelected: circulation != null && circulation == '온라인',
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: CustomInkWellButton(
                      title: '오프라인',
                      onTap: () {
                        setState(() {
                          circulation = '오프라인';
                        });
                      },
                      isSelected: circulation != null && circulation == '오프라인',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40.0),
              const Text(
                '희망 납품업체',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: preferredSupplier
                    .map((e) => CustomInkWellButton(
                          title: e,
                          onTap: () {
                            if (selectedSupplier == e) {
                              selectedSupplier = '';
                            } else {
                              selectedSupplier = e;
                            }
                            setState(() {});
                          },
                          isSelected: selectedSupplier == e,
                        ))
                    .toList(),
              ),
              const SizedBox(height: 40.0),
              const Text(
                '예상 제조 단가',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                suffixText: '원',
                textInputType: TextInputType.number,
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 40.0),
              const Text(
                '예상 제조 기간',
                style: MyTextStyle.bodyTitleMedium,
              ),
              const SizedBox(height: 8.0),
              CustomTextFormField(
                suffixText: '일',
                textInputType: TextInputType.number,
                onChanged: (String value) {},
                onSaved: (String? newValue) {},
                validator: (String? value) {
                  return null;
                },
              ),
              const SizedBox(height: 40.0),
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
