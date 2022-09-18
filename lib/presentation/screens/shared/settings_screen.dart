import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/bottomSheet_widget.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(color: Colors.white),
        backgroundColor: MyThemeData.appblue,
        middle: AppbarTitleText(titleText: "الاعدادات"),
      ),
      body: BodyWhiteContainer(
        withPadding: true,
        bodyChild: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5.h),
              child: CustomElevatedButton(
                  myWidgets: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        DefaultButtonText(text: 'الالوان'),
                        Icon(Icons.arrow_drop_down)
                      ]),
                  otpressFunction: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomButtomSheet(
                              text1: 'مضئ',
                              function1: () {},
                              text2: 'مظلم',
                              function2: () {});
                        });
                  }),
            ),
            CustomElevatedButton(
                myWidgets: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      DefaultButtonText(text: 'اللغه'),
                      Icon(Icons.arrow_drop_down)
                    ]),
                otpressFunction: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return CustomButtomSheet(
                            text1: 'عربي',
                            function1: () {},
                            text2: 'انجليزي',
                            function2: () {});
                      });
                })
          ],
        ),
      ),
    );
  }
}
