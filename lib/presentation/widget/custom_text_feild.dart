import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';

class CustomeTextFeild extends StatelessWidget {
  const CustomeTextFeild({
    Key? key,
    required this.textController,
    required this.feildText,
    required this.withShadow,
    required this.userInputType,
    this.leading,
    this.action,
  }) : super(key: key);
  final TextEditingController textController;
  final String feildText;
  final Widget? leading;
  final Widget? action;
  final bool withShadow;
  final TextInputType userInputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      decoration: withShadow
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
      child: TextField(
        keyboardType: userInputType,
        controller: textController,
        cursorColor: MyThemeData.appyellow,
        decoration: InputDecoration(
          suffixIcon: action,
          prefixIcon: leading,
          hintText: feildText,
          // focusColor: Colors.red,
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 15.sp,
              ),
        ),
      ),
    );
  }
}
