import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';

class BodyWhiteContainer extends StatelessWidget {
  final Widget? bodyChild;
  const BodyWhiteContainer({
    Key? key,
    this.bodyChild,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        margin: EdgeInsets.only(top: 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7.w), topRight: Radius.circular(7.w)),
          color: MyThemeData.backGroundColor,
        ),
        child: bodyChild,
      ),
    );
  }
}
