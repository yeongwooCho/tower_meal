import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:tower_meal/second/consulting/view/second_consulting_screen.dart';
import 'package:tower_meal/second/home/view/second_home_screen.dart';
import 'package:tower_meal/second/mall/view/second_mall_screen.dart';
import 'package:tower_meal/user/view/profile_screen.dart';

import '../../common/const/colors.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_layout.dart';
import '../../common/view/error_screen.dart';

class SecondRootTab extends StatelessWidget {
  final Widget child;

  const SecondRootTab({
    super.key,
    required this.child,
  });

  int getIndex(BuildContext context) {
    switch (GoRouterState.of(context).location) {
      case '/second_home':
        return 0;
      case '/second_consulting':
        return 1;
      case '/second_mall':
        return 2;
      case '/profile':
        return 3;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: MyColor.white,
        selectedItemColor: MyColor.text,
        selectedLabelStyle: MyTextStyle.bodyBold.copyWith(fontSize: 12.0),
        unselectedItemColor: MyColor.middleGrey,
        unselectedFontSize: 12.0,
        unselectedLabelStyle: MyTextStyle.bodyBold.copyWith(fontSize: 12.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: getIndex(context),
        onTap: (int index) {
          switch (index) {
            case 0:
              context.goNamed(SecondHomeScreen.routeName);
            case 1:
              context.goNamed(SecondConsultingScreen.routeName);
            case 2:
              context.goNamed(SecondMallScreen.routeName);
            case 3:
              context.goNamed(ProfileScreen.routeName);
            default:
              context.goNamed(ErrorScreen.routeName);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.house(),
              size: 30.0,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.chalkboardTeacher(),
              size: 30.0,
            ),
            label: '컨설팅',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.storefront(),
              size: 30.0,
            ),
            label: 'Mall',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.user(),
              size: 30.0,
            ),
            label: '내 정보',
          ),
        ],
      ),
      child: child,
    );
  }
}
