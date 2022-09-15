import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:testapp/presentation/widget/drawer.dart';

class LoginFirstScreen extends StatelessWidget {
  const LoginFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(color: Colors.white),
          backgroundColor: MyThemeData.appblue,
        ),
        body: BodyWhiteContainer(
          withPadding: true,
          bodyChild: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 4.h),
                  child: Text('برجاء تسجيل الدخول اولا')),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: CustomElevatedButton(
                    buttonColor: MyThemeData.dappblue,
                    myWidgets: DefaultButtonText(
                      text: 'تسجيل الدخول',
                    ),
                    otpressFunction: () {}),
              )
            ],
          )),
        ),
      ),
    );
  }
}
