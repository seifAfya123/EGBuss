import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';

class NotificationContainer extends StatelessWidget {
  // final MessageModel messageModel;
  final String message;
  final bool isSeen;
  final Function function;

  const NotificationContainer({
    Key? key,
    required this.message,
    required this.function,
    required this.isSeen,
    // required this.messageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.w),
      color: isSeen
          ? MyThemeData.backGroundColor
          : MyThemeData.appblue.withOpacity(0.2),
      height: 25.h,
      child: InkWell(
        onTap: () => function(),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Text("hey mr loldsasda"),
            // message contnet
            Text(message),
            Spacer(),

            Text("نتمني لكم رحله سغيده"),
          ],
        ),
      ),
    );
  }
}
