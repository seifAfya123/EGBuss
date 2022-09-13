import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/constants/const_test_data.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/drawer.dart';
import 'package:testapp/presentation/widget/notification_container.dart';
import 'package:sizer/sizer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyThemeData.appblue,
    ));

    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(title: const AppbarTitleText(titleText: "الاشعارات")),
      body: BodyWhiteContainer(
        bodyChild: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: constMessages.length,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 0.5.w,
              color: MyThemeData.dappDarkblue,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            return NotificationContainer(
              message: constMessages[index],
            );
          },
        ),
      ),
    );
  }
}
