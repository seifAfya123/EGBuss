import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/constants/constant_data.dart';

import 'package:testapp/data/models/ticket.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/custom_image_container.dart';

class TicketDetailsScreen extends StatelessWidget {
  const TicketDetailsScreen({
    Key? key,
    required this.ticket,
  }) : super(key: key);
  final Ticket ticket;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const AppbarTitleText(titleText: 'تذاكر'),
        ),
        body: Center(
          child: Container(
            height: 80.h,
            width: 80.w,
            padding: EdgeInsets.symmetric(vertical: 3.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.w),
              color: MyThemeData.mywhite,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageContainer(
                  imagePath: ConstantData.qrCode,
                  withShadow: false,
                  widthAndHeight: 60.w,
                ),
                ticketSeparator(),
                ticketData(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ticketSeparator() {
    double raduis = 50.w;

    double curvesheight = 15.w;
    double curvesWidth = 10.w;
    return Container(
      // color: Colors.red,
      height: curvesheight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: curvesheight,
            width: curvesWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(raduis),
                bottomLeft: Radius.circular(raduis),
              ),
              color: MyThemeData.appblue,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              shrinkWrap: false,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  width: 6.w,
                  height: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    // color: MyThemeData.appblue,
                  ),
                  child: Divider(
                    thickness: 1.w,
                    color: MyThemeData.appblue,
                  ),
                );
              },
            ),
          ),
          Container(
            height: curvesheight,
            width: curvesWidth,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(raduis),
                  bottomRight: Radius.circular(raduis),
                ),
                color: MyThemeData.appblue),
          ),
        ],
      ),
    );
  }

  Widget ticketData() {
    return Expanded(
      child: Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ticket.ticketNumber!),
            Text(ticket.from!),
            Text(ticket.text1!),
            Text(ticket.to!),
            Text(ticket.text2!),
            Text(ticket.time!),
            // Text(ticket.time!),
          ],
        ),
      ),
    );
  }
}
