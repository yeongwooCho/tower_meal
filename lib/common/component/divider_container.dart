import 'package:flutter/material.dart';

import '../const/colors.dart';

class DividerContainer extends StatelessWidget {
  const DividerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      color: MyColor.lightGrey,
    );
  }
}
