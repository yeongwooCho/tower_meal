import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kpostal/kpostal.dart';
import 'package:tower_meal/common/layout/default_app_bar.dart';
import 'package:tower_meal/kakao_address/model/kakao_address_model.dart';
import 'package:tower_meal/kakao_address/provider/kakao_address_provider.dart';

Future<bool> onTapKakaoAddress({
  required BuildContext context,
  required WidgetRef ref,
}) async {
  try {
    Kpostal result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => KpostalView(
          appBar: const DefaultAppBar(title: '주소 검색'),
        ),
      ),
    );

    ref.read(kakaoAddressProvider.notifier).update(
          (state) => KakaoAddressModel(
            postCode: result.postCode,
            address: result.address,
            roadAddress: result.roadAddress,
            jibunAddress: result.jibunAddress,
            region: result.sido,
            latitude: result.latitude ?? 0.0,
            longitude: result.longitude ?? 0.0,
          ),
        );
    return true;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}
