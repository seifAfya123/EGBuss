import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/constants/constant_data.dart';

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
    return InkWell(
      onTap: () => fun(),
      child: Container(
        width: 20.w,
        height: 20.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w),
          color: seatStatus == SeatStatus.notAvailable
              ? Colors.red
              : seatStatus == SeatStatus.available
                  ? Colors.grey
                  : Colors.yellow,
        ),
        child: const Icon(
          Icons.chair_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
