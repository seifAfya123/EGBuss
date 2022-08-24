import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyThemeData {
  // static const Color primaryColor = Color.fromARGB(255, 183, 147, 95);
  static const Color primaryColor = Color(0xffFDAF01);
  static const Color dprimaryColor = Color.fromARGB(255, 20, 26, 46);
  static const Color dAccentColor = Colors.orange;
  static const Color textColor = Colors.black;

  // static const Color titleColor = Colors.black;
  static const Color appyellow = Color(0xffFDAF01); //ko7ly
  static const Color appblue = Color(0xff019DFD); //ko7ly

  static const Color backgroundcolor = Color(0xffF9FAFC);
  static const Color mywhite = Color(0xffffffff);

  ///////////////////////////////////////////////////////////
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: backgroundcolor,
    iconTheme: const IconThemeData(color: appyellow),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: mywhite, foregroundColor: appyellow),
    shadowColor: Colors.grey.withOpacity(0.3),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(5.w),
        maximumSize: Size(96.w, 9.h),
        minimumSize: Size(65.w, 8.h),
        alignment: Alignment.center,
        primary: appyellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.w),
          // side: BorderSide(color: Colors.red),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: appblue,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.white)),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: MyThemeData.primaryColor),
    primaryColor: MyThemeData.primaryColor,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 18.sp, color: textColor, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 18.sp, color: appyellow),
      headline6: TextStyle(fontSize: 15.sp, color: mywhite),
      bodyText1: TextStyle(
          fontSize: 14.sp, color: textColor, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 14.sp, color: textColor),
      subtitle1: TextStyle(
          fontSize: 18.sp, color: textColor, fontWeight: FontWeight.bold),
      subtitle2: TextStyle(
        fontSize: 14.sp,
        color: textColor.withOpacity(0.5),
      ),
    ),
  );
//////////////////////////////////////////////
  static ThemeData darkTheme = ThemeData();
}
