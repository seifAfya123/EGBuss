import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:testapp/data/models/mesasge.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({
    Key? key,
    required this.message,
  }) : super(key: key);

  final Mesasge message;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyThemeData.appblue,
    ));

    return SafeArea(
      child: Scaffold(
        appBar: const CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(color: Colors.white),
          backgroundColor: MyThemeData.appblue,
          middle: AppbarTitleText(titleText: "الاشعارات"),
        ),
        body: BodyWhiteContainer(
          withPadding: true,
          bodyChild: Container(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                ),
                Spacer(),

                Text("نتمني لكم رحله سغيده"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
