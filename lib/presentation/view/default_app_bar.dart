import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';

class DefaultAppBar extends StatelessWidget {
  final String titleText;
  final List<Widget>? actionsWidgets;
  final VoidCallback? backButtonFun;
  final Color? appBarColor;
  const DefaultAppBar({
    Key? key,
    this.actionsWidgets,
    this.backButtonFun,
    required this.titleText,
    this.appBarColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appBarColor ?? MyThemeData.appblue,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(2.w),
      height: 10.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: backButtonFun ?? () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: MyThemeData.mywhite,
            ),
          ),
          Expanded(
              child: Center(
            child: Text(
              titleText,
              style: Theme.of(context).textTheme.headline1,
            ),
          )),
          Row(children: actionsWidgets ?? []),
        ],
      ),
    );
  }
}
