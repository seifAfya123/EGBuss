import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({Key? key}) : super(key: key);

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
          middle: AppbarTitleText(titleText: "الامان و الخصوصيه"),
          border: Border(bottom: BorderSide(style: BorderStyle.none)),
        ),
        body: Center(
          child: BodyWhiteContainer(
            bodyChild: Container(),
          ),
        ),
      ),
    );
  }
}
