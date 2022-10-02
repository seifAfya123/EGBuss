import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';

class CustomButtomSheet extends StatelessWidget {
  String text1;
  Function function1;
  String text2;
  Function function2;

  CustomButtomSheet({
    Key? key,
    required this.text1,
    required this.function1,
    required this.text2,
    required this.function2,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10.h, right: 8.w, left: 8.w),
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(bottom: 5.h),
          child: CustomElevatedButton(
              myWidgets: Text(
                text1,
                style: TextStyle(fontSize: 6.w, fontWeight: FontWeight.bold),
              ),
              otpressFunction: () {
                function1;
              }),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8.h),
          child: CustomElevatedButton(
              buttonColor: MyThemeData.appGery,
              myWidgets: Text(
                text2,
                style: TextStyle(
                    color: MyThemeData.appDarkblue,
                    fontSize: 6.w,
                    fontWeight: FontWeight.bold),
              ),
              otpressFunction: () {
                function2;
              }),
        ),
        CustomElevatedButton(
            buttonColor: MyThemeData.appblue,
            myWidgets: Text(
              'الغاء',
              style: TextStyle(fontSize: 6.w, fontWeight: FontWeight.bold),
            ),
            otpressFunction: () {
              Navigator.pop(context);
            }),
      ]),
    );
  }
}
