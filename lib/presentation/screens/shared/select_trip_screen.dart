import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:testapp/presentation/widget/drawer.dart';
import 'package:testapp/presentation/widget/leaving_and_arriving_card.dart';
import 'package:sizer/sizer.dart';

class SelectTripScreen extends StatefulWidget {
  const SelectTripScreen({Key? key}) : super(key: key);

  @override
  State<SelectTripScreen> createState() => _SelectTripScreenState();
}

class _SelectTripScreenState extends State<SelectTripScreen> {
  bool isOneWayTrip = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyThemeData.appblue,
    ));
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Text("حجز"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BodyWhiteContainer(
              bodyChild: Column(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    height: 9.h,
                    padding: EdgeInsets.all(2.w),
                    margin: EdgeInsets.only(top: 2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.w),
                      color: MyThemeData.appblue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        tripType("ذهاب فقط", isOneWayTrip),
                        tripType("ذهاب و عوده", !isOneWayTrip),
                      ],
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      const LeavingAndArrivingCard(isFrom: false),
                      SizedBox(width: 3.w),
                      const LeavingAndArrivingCard(isFrom: true),
                    ],
                  ),
                  SizedBox(height: 3.h),
                  AnimatedCrossFade(
                    firstCurve: Curves.easeInCirc,
                    firstChild: const Expanded(
                        child: LeavingAndArrivingCard(isFrom: false)),
                    secondChild: Row(
                      children: [
                        LeavingAndArrivingCard(isFrom: false),
                        SizedBox(width: 3.w),
                        LeavingAndArrivingCard(isFrom: false),
                      ],
                    ),
                    crossFadeState: isOneWayTrip
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(microseconds: 3500),
                  ),
                  SizedBox(height: 3.h),
                  CustomElevatedButton(
                    buttonColor: MyThemeData.appblue,
                    myWidgets: const DefaultButtonText(text: "search"),
                    otpressFunction: () {},
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tripType(title, isYellow) {
    return InkWell(
      onTap: () {
        !isYellow
            ? setState(() {
                isOneWayTrip = !isOneWayTrip;
              })
            : null;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: isYellow ? MyThemeData.appyellow : MyThemeData.appblue,
        ),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
