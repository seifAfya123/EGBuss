import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/constants/const_test_data.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';

class CreditPaymentMethod extends StatelessWidget {
  CreditPaymentMethod({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController creditNumberController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 1.5.w),
          child: Row(
            children: [
              Text('2- ادخل التفاصيل'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 6.w),
          child: Row(
            children: [
              Text('الأسم'),
            ],
          ),
        ),
        CustomeTextFeild(
          textController: nameController,
          feildText: 'الأسم',
          withShadow: true,
          userInputType: TextInputType.name,
          leading: Icon(Icons.person),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 2.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: Row(
                  children: [
                    Text('رقم الكارت'),
                  ],
                ),
              ),
              CustomeTextFeild(
                textController: creditNumberController,
                feildText: 'رقم الكارت',
                withShadow: true,
                userInputType: TextInputType.name,
                leading: Icon(Icons.credit_card),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                margin: EdgeInsets.only(right: 6.w), child: Text('Exp. date')),
            Container(margin: EdgeInsets.only(left: 5.w), child: Text('CVV'))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 2.h, bottom: 2.h, right: 4.w),
              child: Column(
                children: [
                  CustomeTextFeild(
                    textController: yearController,
                    feildText: 'السنه',
                    withShadow: true,
                    userInputType: TextInputType.name,
                    leading: Icon(Icons.arrow_drop_down),
                    width: 30.w,
                    height: 10.h,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.h, bottom: 2.h),
              child: Column(
                children: [
                  CustomeTextFeild(
                    textController: monthController,
                    feildText: 'الشهر',
                    withShadow: true,
                    userInputType: TextInputType.name,
                    leading: Icon(Icons.arrow_drop_down),
                    width: 30.w,
                    height: 10.h,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2.h, bottom: 2.h, left: 4.w),
              child: Column(
                children: [
                  CustomeTextFeild(
                    textController: cvvController,
                    feildText: 'CVV',
                    withShadow: true,
                    userInputType: TextInputType.name,
                    width: 20.w,
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 2.h),
          child: CustomElevatedButton(
            buttonColor: MyThemeData.appblue,
            myWidgets: const DefaultButtonText(text: "تاكيد"),
            otpressFunction: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutNamesDart.rTripTicketScreen,
                  arguments: tickets[0],
                  (Route<dynamic> route) => true);
            },
          ),
        )
      ],
    );
  }
}
