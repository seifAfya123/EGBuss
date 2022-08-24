import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';

class LeavingAndArrivingCard extends StatelessWidget {
  const LeavingAndArrivingCard({
    Key? key,
    required this.isArriving,
  }) : super(key: key);
  final bool isArriving;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.w),
        color: MyThemeData.appblue,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 1.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        // vertical: 2.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(isArriving ? "وقت المغادره" : "وقت الوصول"),
              // DateTime.now().day.toString()
              DefaultButtonText(text: "الثلاثاء 14/5")
            ],
          ),
          SizedBox(width: 2.w),
          const Icon(
            Icons.bus_alert_outlined,
            color: MyThemeData.appyellow,
          )
        ],
      ),
    );
  }
}
