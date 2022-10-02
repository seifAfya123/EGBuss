import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';

class CustomeTextFeild extends StatelessWidget {
  CustomeTextFeild({
    Key? key,
    required this.textController,
    required this.feildText,
    required this.withShadow,
    required this.userInputType,
    this.leading,
    this.action,
    this.height,
    this.width,
  }) : super(key: key);
  final TextEditingController textController;
  final String feildText;
  final Widget? leading;
  final Widget? action;
  final bool withShadow;
  final TextInputType userInputType;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 7.h,
      width: width ?? 100.w,
      alignment: Alignment.center,
      // margin: EdgeInsets.symmetric(horizontal: 3.w),
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
              borderRadius: BorderRadius.circular(3.w),
              color: Colors.white,
            ),
      child: TextField(
        // textAlign: TextAlign.center,

        keyboardType: userInputType,
        controller: textController,
        cursorColor: MyThemeData.appblue,
        decoration: InputDecoration(
          // fillColor: MyThemeData.mywhite,
          // filled: true,
          suffixIcon: action,
          prefixIcon: leading,
          hintText: "  " + feildText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.w)),
            borderSide: BorderSide(color: MyThemeData.appblue, width: 0.5.w),
          ),
          border: InputBorder.none,
          hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(
                fontSize: 15.sp,
              ),
        ),
      ),
    );
  }
}
