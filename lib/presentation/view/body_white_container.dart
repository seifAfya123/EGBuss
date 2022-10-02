import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';

class BodyWhiteContainer extends StatelessWidget {
  final Widget? bodyChild;
  final bool? withPadding;
  const BodyWhiteContainer({
    Key? key,
    this.bodyChild,
    this.withPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: withPadding == null || withPadding == false ? 0 : 3.w,
          vertical: withPadding == null || withPadding == false ? 0 : 3.h),
      margin: EdgeInsets.only(top: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7.w), topRight: Radius.circular(7.w)),
        color: MyThemeData.backGroundColor,
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(7.w), topRight: Radius.circular(7.w)),
          child: bodyChild),
    );
  }
}
