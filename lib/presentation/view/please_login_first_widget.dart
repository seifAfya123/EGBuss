import 'package:flutter/material.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';

class PleaseLoginFirstWidget extends StatelessWidget {
  const PleaseLoginFirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("please login first"),
        CustomElevatedButton(
          myWidgets: DefaultButtonText(text: "login"),
          otpressFunction: () {},
        )
      ],
    );
  }
}
