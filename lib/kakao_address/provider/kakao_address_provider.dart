import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tower_meal/kakao_address/model/kakao_address_model.dart';

final kakaoAddressProvider = StateProvider<KakaoAddressModelBase>(
  (ref) => KakaoAddressModelLoading(),
);
