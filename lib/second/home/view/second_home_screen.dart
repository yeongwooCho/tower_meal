import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tower_meal/common/const/image_path.dart';
import 'package:tower_meal/home/view/home_screen.dart';

import '../../../common/const/colors.dart';
import '../../../common/const/data.dart';
import '../../../common/const/text_styles.dart';
import '../../../common/layout/default_app_bar.dart';
import '../../../common/layout/default_layout.dart';

class SecondHomeScreen extends StatelessWidget {
  static String get routeName => "second_home";

  const SecondHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '',
        titleWidget: AnimatedToggleSwitch<int>.rolling(
          current: 1,
          values: const [0, 1],
          height: 40.0,
          onChanged: (int value) {
            if (value == 0) {
              context.goNamed(HomeScreen.routeName);
            } else {
              context.goNamed(SecondHomeScreen.routeName);
            }
          },

          iconList: [
            Text(
              '쇼핑몰',
              style: MyTextStyle.minimumRegular.copyWith(
                color: MyColor.white,
              ),
            ),
            Text(
              '브랜딩',
              style: MyTextStyle.minimumRegular.copyWith(
                color: MyColor.white,
              ),
            ),
          ],
          style: const ToggleStyle(
            backgroundColor: MyColor.secondary,
            indicatorColor: MyColor.primary,
            borderColor: MyColor.empty,
          ), // optional style settings
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Image.asset(ImagePath.logoBlack),
        ),
        leadingWidth: 120,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(ImagePath.banner),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
              child: Image.asset(ImagePath.serviceImage),
            ),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColor.lightGrey,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final title = footerData[index];

            return Text(
              title,
              style: (index == 0)
                  ? MyTextStyle.minimumRegular.copyWith(
                      fontWeight: FontWeight.bold,
                      color: MyColor.darkGrey,
                    )
                  : MyTextStyle.minimumRegular.copyWith(
                      color: MyColor.darkGrey,
                    ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 4.0);
          },
          itemCount: footerData.length,
        ),
      ),
    );
  }
}
