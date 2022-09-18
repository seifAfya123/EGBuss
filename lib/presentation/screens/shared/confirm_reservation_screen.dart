import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:sizer/sizer.dart';

class ConfirmReservationScreen extends StatelessWidget {
  const ConfirmReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(CupertinoIcons.back)),
            title: const AppbarTitleText(titleText: "اختر مقعدك")),
        body: BodyWhiteContainer(
          withPadding: true,
          bodyChild: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 2.h),
                  titleText(title: "رقم الرحله", context: context),
                  descriptionText(
                      description: "القاهره - محطه الماظه", context: context),
                  titleText(title: "من", context: context),
                  descriptionText(
                      description: "القاهره - محطه الماظه", context: context),
                  titleText(title: "الي", context: context),
                  descriptionText(
                      description: "الاسكندريه - محرم بك", context: context),
                  titleText(title: "اليوم", context: context),
                  descriptionText(
                      description: "الجمعه 26 يناير 2021", context: context),
                  titleText(title: "ميعاد المغادره", context: context),
                  descriptionText(description: "6 مساء", context: context),
                  titleText(title: "المقاعد", context: context),
                  descriptionText(description: "45,65,47", context: context),
                  SizedBox(height: 3.h),
                  CustomElevatedButton(
                    buttonColor: MyThemeData.appblue,
                    myWidgets: const DefaultButtonText(text: "تاكيد"),
                    otpressFunction: () {
                      Navigator.pushNamed(
                          context, RoutNamesDart.rPaymentMethodScreen);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget titleText({
    required String title,
    required BuildContext context,
  }) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline2,
    );
  }

  Widget descriptionText({
    required String description,
    required BuildContext context,
  }) {
    return Text(
      description,
      style: Theme.of(context).textTheme.bodyText2,
    );
  }
}
