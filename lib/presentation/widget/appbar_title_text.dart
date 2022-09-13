import 'package:flutter/material.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';

class AppbarTitleText extends StatelessWidget {
  const AppbarTitleText({
    Key? key,
    required this.titleText,
  }) : super(key: key);
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return Text(titleText,
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: MyThemeData.mywhite));
  }
}
