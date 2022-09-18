import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyThemeData {
// light theme colors
  static const Color seatNumberColor = Color(0xff9A9174); //kind of yellow
  static const Color mov = Color(0xffC21EEB); //kind of mov
  static const Color appGery = Color(0xffE9E9E9); //kind of grey
  static const Color appyellow = Color(0xffEBB81E); //yellow
  static const Color appblue = Color(0xff06ACD4); // blue
  static const Color appDarkblue = Color(0xff464362); //ko7ly
  static const Color backGroundColor = Color(0xffF7F7F7); // dirty white
  static const Color mywhite = Color(0xffffffff); // white
// Dark theme colors
  static const Color dseatNumberColor = Color(0xff9A9174); //kind of yellow
  static const Color dmov = Color(0xffC21EEB); //kind of mov
  static const Color dappGery = Color(0xffE9E9E9); //kind of grey
  static const Color dappyellow = Color(0xffEBB81E); //yellow
  static const Color dappblue = Color(0xff06ACD4); // blue
  static const Color dappDarkblue = Color(0xff464362); //ko7ly
  static const Color dbackGroundColor = Color(0xffF7F7F7); // dirty white
  static const Color dmywhite = Color(0xffffffff); // white

  ///////////////////////////////////////////////////////////
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: appblue,
    iconTheme: const IconThemeData(color: appyellow),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: mywhite, foregroundColor: appyellow),
    shadowColor: Colors.grey.withOpacity(0.3),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(5.w),
        maximumSize: Size(96.w, 9.h),
        minimumSize: Size(60.w, 8.h),
        alignment: Alignment.center,
        primary: appyellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.w),
          // side: BorderSide(color: Colors.red),
        ),
      ),
    ),
    // cupertinoOverrideTheme: CupertinoThemeData(
    //   scaffoldBackgroundColor: backGroundColor,
    //   primaryColor: appblue, // HERE COLOR OF LEADING
    // ),
    appBarTheme: const AppBarTheme(
      backgroundColor: appblue,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.black),
        unselectedIconTheme: IconThemeData(color: Colors.white)),
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: appyellow),
    primaryColor: appyellow,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 18.sp, color: appDarkblue, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 18.sp, color: appyellow),
      headline6: TextStyle(fontSize: 14.sp, color: backGroundColor),
      bodyText1: TextStyle(
          fontSize: 14.sp, color: appDarkblue, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 14.sp, color: appDarkblue),
      subtitle1: TextStyle(
          fontSize: 14.sp, color: appDarkblue, fontWeight: FontWeight.w500),
      subtitle2: TextStyle(
        fontSize: 14.sp,
        color: appDarkblue.withOpacity(0.5),
      ),
    ),
  );
//////////////////////////////////////////////
  static ThemeData darkTheme = ThemeData();
}
