import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../common/const/colors.dart';
import '../../common/const/data.dart';
import '../../common/const/text_styles.dart';
import '../../common/layout/default_app_bar.dart';
import '../../common/layout/default_layout.dart';

class HomeScreen extends StatelessWidget {
  static String get routeName => "home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(
        title: 'Tower Meal',
        centerTitle: false,
        backgroundColor: MyColor.primary,
        foregroundColor: MyColor.white,
        action: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: PhosphorIcon(
                PhosphorIcons.shoppingCart(),
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'asset/img/banner/banner.png',
            ),
            _ServiceInfoContainer(),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

class _ServiceInfoContainer extends StatelessWidget {
  const _ServiceInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset('asset/img/logo/service.png'),
          ),
        ],
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
