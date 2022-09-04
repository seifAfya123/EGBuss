import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyThemeData.appblue,
    ));

    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("الاشعارات"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BodyWhiteContainer(
              bodyChild: Container(),
            )
          ],
        ),
      ),
    );
  }
}
