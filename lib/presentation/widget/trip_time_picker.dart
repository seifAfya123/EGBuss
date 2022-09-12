import 'package:flutter/material.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:sizer/sizer.dart';

class TripTimePicker extends StatelessWidget {
  final Function function;

  const TripTimePicker({
    Key? key,
    required this.function,
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
              Text("pick your trip time"),
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
