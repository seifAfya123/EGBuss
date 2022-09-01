import 'package:flutter/material.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_cicular_image.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/widget/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text("الملف الشخصى"),
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 2.h),
              CustomCicularImage(
                imgRadius: 35.w,
              ),
              Text(
                "مرحبا مروه",
                style: Theme.of(context).textTheme.headline1,
              ),
              placeHoldingWidget(),
              placeHoldingWidget(),
              placeHoldingWidget(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: CustomElevatedButton(
                    myWidgets: [DefaultButtonText(text: "تسجيل الخروج")],
                    otpressFunction: () {
                      Navigator.pushReplacementNamed(
                          context, RoutNamesDart.rLoginScreen);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  placeHoldingWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w), color: MyThemeData.appblue),
      height: 10.h,
      child: Row(),
    );
  }
}
