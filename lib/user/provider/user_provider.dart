import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tower_meal/common/const/image_path.dart';

import '../model/address_model.dart';
import '../model/user_model.dart';

final userProvider = StateNotifierProvider<UserStateNotifier, UserModelBase>(
  (ref) => UserStateNotifier(),
);

class UserStateNotifier extends StateNotifier<UserModelBase> {
  UserStateNotifier() : super(UserModelLoading()) {
    initItems();
  }

  void initItems() {
    state = UserModel(
      id: 1,
      email: 'tower0601@naver.com',
      username: 'tower0601',
      password: 'tower',
      name: '김준혁',
      phone: '01012341234',
      profileImage: ImagePath.user,
      address: AddressModel(
        id: 1,
        name: '김준혁',
        phone: '010-1234-1234',
        address: '서울특별시 종로구 세종대로 172',
        detailAddress: '103동 502호',
        memo: '부재시 경비실에 맡겨주세요.',
      ),
    );
  }
}
