import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

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
          border: Border(bottom: BorderSide(style: BorderStyle.none)),
          middle: AppbarTitleText(titleText: "تواصل معنا"),
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
