import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/component/default_button.dart';
import '../../common/component/show/show_component_modal_bottom_sheet.dart';
import '../../common/component/show/show_cupertino_alert.dart';
import '../../common/const/colors.dart';
import '../../common/const/image_path.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';
import '../../common/utils/data_utils.dart';
import '../model/user_model.dart';
import '../provider/user_provider.dart';
import 'edit_profile_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends ConsumerWidget {
  static String get routeName => "profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '내 정보'),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            if (user is UserModel)
              renderProfileTitle(
                context: context,
                user: user,
              ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'All One Food',
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text(
                              //   allOneFood.consultingType,
                              //   style: MyTextStyle.bodyRegular,
                              // ),
                              const SizedBox(height: 4.0),
                              Text(
                                DataUtils.convertDateTimeToDateTimeString(
                                    datetime: DateTime.now()),
                                style: MyTextStyle.descriptionRegular,
                              ),
                            ],
                          ),
                          SecondaryButton(
                            onPressed: () {
                              showCustomModalBottomSheet(
                                context: context,
                                bottomSheetWidget: Container(
                                  color: Colors.red,
                                  height: 200.0,
                                ),
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
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                height: 10.0,
                color: MyColor.lightGrey,
              ),
            ),
            renderIconAndTextButton(
              icon: PhosphorIcon(
                PhosphorIcons.shoppingBagOpen(),
                size: 28.0,
              ),
              title: '주문내역',
              onTap: () {
                // context.pushNamed(OrderListScreen.routeName);
              },
            ),
            renderIconAndTextButton(
              icon: PhosphorIcon(
                PhosphorIcons.signOut(),
                size: 28.0,
              ),
              title: '로그아웃',
              onTap: () {
                showCustomCupertinoAlert(
                  context: context,
                  titleWidget: const Text('로그아웃 하시겠습니까?'),
                  completeText: '확인',
                  completeFunction: () {
                    context.goNamed(LoginScreen.routeName);
                  },
                  cancelText: '취소',
                  cancelFunction: () {
                    context.pop();
                  },
                );
              },
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget renderProfileTitle({
    required BuildContext context,
    required UserModel user,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagePath.user,
            height: 72.0,
            width: 72.0,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  user.name,
                  style: MyTextStyle.bigTitleRegular,
                ),
                TextButton(
                  onPressed: () {
                    context.pushNamed(EditProfileScreen.routeName);
                  },
                  child: Text(
                    '내 정보 수정',
                    style: MyTextStyle.descriptionRegular.copyWith(
                      color: MyColor.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget renderIconAndTextButton({
    required Widget icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              icon,
              const SizedBox(width: 12.0),
              Text(
                title,
                style: MyTextStyle.bodyTitleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
