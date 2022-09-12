import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/data/models/ticket.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';

class AvailableTickets extends StatelessWidget {
  Ticket ticket;
Function function;
  AvailableTickets({
    Key? key,
    required this.ticket,
    required this.function,
  }) : super(key: key);
  double constBorderRaduis = 5.w;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>function(),
      child: Container(
        margin: EdgeInsets.only(top: 3.h, bottom: 0.5.h),
        width: 90.w,
        height: 30.h,
        decoration: BoxDecoration(
          border: Border.all(width: 0.2.w),
          borderRadius: BorderRadius.circular(constBorderRaduis),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(1.5.w),
              child: Row(
                children: [
                  Text(ticket.ticketNumber!),
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
                              Text(ticket.from!,
                                  style: TextStyle(
                                      fontSize: 5.w,
                                      fontWeight: FontWeight.bold)),
                              Text(ticket.to!,
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
                          Text(ticket.text1!, style: TextStyle(fontSize: 4.w)),
                          Text(ticket.text2!,
                              style: TextStyle(
                                  fontSize: 5.w, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('وقت المغادرة', style: TextStyle(fontSize: 4.w)),
                          Text(
                            ticket.time!,
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
            Expanded(
              child: Container(
                // height: 5.5.h,
                // width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(constBorderRaduis),
                      bottomRight: Radius.circular(constBorderRaduis)),
                  color: ticket.type == "vip"
                      ? MyThemeData.appyellow
                      : MyThemeData.appblue,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 3.5.w, right: 3.5.w),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ticket.type!,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        Text(ticket.price!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
