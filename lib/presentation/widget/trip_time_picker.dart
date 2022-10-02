import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';

class TripTimePicker extends StatelessWidget {
  final Function function;
  String text;
  TripTimePicker({
    Key? key,
    required this.function,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => function(),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.w),
              color: MyThemeData.appyellow),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.white),
              ),
              Text(""),
              Icon(
                Icons.date_range,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
