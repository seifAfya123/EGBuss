import 'package:flutter/material.dart';
import 'package:testapp/constants/app_strings.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:testapp/presentation/widget/svg_icon_viwer.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SvgIconViwer(iconPath: AppStrings.forgetPassword),
          const Text(
            "نسيت كلمه السر؟",
            style: TextStyle(color: MyThemeData.appblue),
          ),
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Text(
              "لا توجد مشكله فقط ادخل رقم الهاتف و اضغط علي ارسال الرمز و سوف نرسل لك رساله بها رمز لنتاكد انك المستخدم الحقيقي",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          CustomeTextFeild(
              textController: textEditingController,
              feildText: "Phone Number",
              withShadow: true,
              userInputType: TextInputType.phone),
          ElevatedButton(
              onPressed: () {}, child: DefaultButtonText(text: "ارسل الرمز"))
        ],
      ),
    );
  }
}
