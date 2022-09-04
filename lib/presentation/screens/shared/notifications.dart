import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/drawer.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyThemeData.appblue,
    ));

    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
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
