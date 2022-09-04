import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';

class AvailableTickets extends StatelessWidget {
  String ticketNumber;
  String from;
  String to;
  String text1;
  String text2;
  String time;
  String price;
  String type;
  Color typeColor;
  AvailableTickets({
    Key? key,
    required this.ticketNumber,
    required this.from,
    required this.to,
    required this.text1,
    required this.text2,
    required this.time,
    required this.price,
    required this.type,
    required this.typeColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 3.h, bottom: 0.5.h),
      width: 90.w,
      height: 30.h,
      decoration: BoxDecoration(
          border: Border.all(width: 0.2.w),
          borderRadius: BorderRadius.circular(5.w)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(1.5.w),
            child: Row(
              children: [
                Text(ticketNumber),
              ],
            ),
          ),
          Divider(
            height: 0.2.w,
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                        height: 18.h,
                        margin: EdgeInsets.only(left: 1.w, right: 1.w),
                        child: Tab(
                          icon: Image.asset('assets/icons/Group274.png'),
                        )),
                    Container(
                        margin: EdgeInsets.only(left: 1.w, right: 1.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(from,
                                style: TextStyle(
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.bold)),
                            Text(to,
                                style: TextStyle(
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                  ],
                ),
                VerticalDivider(
                  thickness: 0.2.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(text1, style: TextStyle(fontSize: 4.w)),
                        Text(text2,
                            style: TextStyle(
                                fontSize: 5.w, fontWeight: FontWeight.bold))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('وقت المغادرة', style: TextStyle(fontSize: 4.w)),
                        Text(
                          time,
                          style: TextStyle(
                              fontSize: 5.w, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 5.5.h,
            width: 90.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5.w),
                    bottomRight: Radius.circular(5.w)),
                color: typeColor),
            child: Padding(
              padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      type,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(price,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
