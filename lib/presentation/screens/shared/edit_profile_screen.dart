import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصى'),
      ),
      body: Column(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: 3.h, right: 5.w, left: 5.w, bottom: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('الاسم'),
                CustomeTextFeild(
                  textController: nameController,
                  feildText: 'ahmed',
                  withShadow: true,
                  userInputType: TextInputType.name,
                  leading: Icon(Icons.person),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('رقم الهاتف'),
                CustomeTextFeild(
                  textController: phoneNumberController,
                  feildText: '01215458865',
                  withShadow: true,
                  userInputType: TextInputType.number,
                  leading: Icon(Icons.phone_iphone),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('البريد الألكترونى'),
                CustomeTextFeild(
                  textController: emailController,
                  feildText: 'Ahmedmo@gmail.com',
                  withShadow: true,
                  userInputType: TextInputType.emailAddress,
                  leading: Icon(Icons.email_outlined),
                ),
              ],
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 8.h, right: 8.h, left: 8.h, bottom: 1.h),
            child: CustomElevatedButton(
              myWidgets: const DefaultButtonText(text: "تغيير كلمه السر"),
              otpressFunction: () {
                Navigator.pushNamed(
                    context, RoutNamesDart.rAvailableTripsScreen);
              },
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: 4.h, right: 8.h, left: 8.h, bottom: 1.h),
            child: CustomElevatedButton(
              myWidgets: const DefaultButtonText(text: "تاكيد"),
              otpressFunction: () {
                Navigator.pushNamed(
                    context, RoutNamesDart.rAvailableTripsScreen);
              },
              buttonColor: MyThemeData.dappblue,
            ),
          ),
        ],
      ),
    );
  }
}