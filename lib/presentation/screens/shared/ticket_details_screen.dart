import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/constants/app_strings.dart';
import 'package:testapp/constants/constant_data.dart';

import 'package:testapp/data/models/ticket.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/custom_image_container.dart';

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({
    Key? key,
    required this.ticket,
  }) : super(key: key);
  final Ticket ticket;

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  List<Widget> cuts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      for (var i = 0; i < 12; i++) {
        cuts.add(Container(
          margin: EdgeInsets.symmetric(horizontal: 1.w),
          width: 3.w,
          height: 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: MyThemeData.appblue,
          ),
          child: Divider(
            thickness: 0.5.w,
            color: MyThemeData.appblue,
          ),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const AppbarTitleText(titleText: 'تذاكر'),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(CupertinoIcons.back)),
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
                Text(widget.ticket.ticketNumber!),
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
    double curvesWidth = 8.w;
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: cuts),
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
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        // color: Colors.red,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText('من'),
                Text(widget.ticket.from!),
                titleText('الي'),
                Text(widget.ticket.to!),
                titleText(widget.ticket.text1!),
                Text(widget.ticket.text2!),
                Text(widget.ticket.time!),
                // Text(ticket.time!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget titleText(data) {
    return Text(
      data,
      style: Theme.of(context)
          .textTheme
          .headline2!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
