import 'dart:html';

import 'package:flutter/material.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          const Text("تغيير كلمه السر"),
          const Text("ادخل كلمه السر"),
          CustomeTextFeild(
              textController: password,
              feildText: "كلمه السر الجديده",
              withShadow: true,
              userInputType: TextInputType.visiblePassword),
          CustomeTextFeild(
              textController: cpassword,
              feildText: "تاكيد كلمه السر",
              withShadow: true,
              userInputType: TextInputType.visiblePassword),
          CustomElevatedButton(
            myWidgets: DefaultButtonText(text: "حفظ"),
            otpressFunction: () {
              // cubit
              Navigator.pushReplacementNamed(
                  context, RoutNamesDart.rHomeScreen);
            },
          )
        ],
      ),
    );
  }
}
