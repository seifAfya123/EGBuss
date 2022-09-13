import 'package:flutter/material.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';

class SelectTripScreen extends StatelessWidget {
  const SelectTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const AppbarTitleText(titleText: "asd")),
      body: Container(),
    );
  }
}
