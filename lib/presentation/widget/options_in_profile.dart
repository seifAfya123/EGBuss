import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';

class OptionsInProfile extends StatelessWidget {
  Icon icons;
  String text;

  String route;
  OptionsInProfile({
    Key? key,
    required this.icons,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
      child: Container(
        margin: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: MyThemeData.appyellow),
        height: 15.h,
        width: 25.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons.icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
