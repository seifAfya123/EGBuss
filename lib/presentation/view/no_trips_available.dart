import 'package:flutter/material.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';

class NoTripsAvailable extends StatelessWidget {
  const NoTripsAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.bus_alert),
        const Text(
          'NoTripsAvailable is working',
          style: TextStyle(fontSize: 20),
        ),
        CustomElevatedButton(
          buttonColor: MyThemeData.appblue,
          myWidgets: const DefaultButtonText(text: "search again"),
          otpressFunction: () {},
        )
      ],
    );
  }
}
