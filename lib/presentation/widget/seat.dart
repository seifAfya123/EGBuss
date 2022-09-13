import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';

class Seat extends StatelessWidget {
  final SeatStatus seatStatus;
  final Function fun;
  const Seat({
    Key? key,
    required this.seatStatus,
    required this.fun,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double seatSize = 12.w;
    return InkWell(
      onTap: () => fun(),
      child: Container(
        width: seatSize,
        height: seatSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          color: seatStatus == SeatStatus.lane
              ? Colors.transparent
              : seatStatus == SeatStatus.notAvailable
                  ? MyThemeData.dappDarkblue
                  : seatStatus == SeatStatus.available
                      ? Colors.grey
                      : MyThemeData.appyellow,
        ),
      ),
    );
  }
}
