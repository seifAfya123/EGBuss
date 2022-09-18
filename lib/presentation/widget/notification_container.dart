import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/data/models/mesasge.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';

class NotificationContainer extends StatelessWidget {
  // final MessageModel messageModel;
  final Mesasge message;

  const NotificationContainer({
    Key? key,
    required this.message,
    // required this.messageModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 3.w),
      color: message.isSeen!
          ? MyThemeData.backGroundColor
          : MyThemeData.appblue.withOpacity(0.2),
      height: 20.h,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RoutNamesDart.rNotificationDetailsScreen,
            arguments: message,
          );
        },
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Text(
              "hey mr ${message.title}",
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: MyThemeData.appDarkblue),
            ),
            // message contnet
            Text(
              message.messageContent!,
              style: Theme.of(context).textTheme.bodyText2,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),

            Text("نتمني لكم رحله سعيده"),
          ],
        ),
      ),
    );
  }
}
