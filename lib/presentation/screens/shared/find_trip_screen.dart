import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:testapp/presentation/widget/drawer.dart';
import 'package:testapp/presentation/widget/leaving_and_arriving_card.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/widget/trip_time_picker.dart';

class FindTripScreen extends StatefulWidget {
  const FindTripScreen({Key? key}) : super(key: key);

  @override
  State<FindTripScreen> createState() => _FindTripScreenState();
}

class _FindTripScreenState extends State<FindTripScreen> {
  bool isOneWayTrip = true;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: MyThemeData.appblue,
    ));
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const AppbarTitleText(titleText: "حجز"),
        ),
        body: Center(
          child: BodyWhiteContainer(
            withPadding: true,
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
                SizedBox(height: 2.h),
                Row(
                  children: [
                    LeavingAndArrivingCard(
                        isFrom: false,
                        function: () {
                          debugPrint("bottomsheet");
                        }),
                    SizedBox(width: 3.w),
                    LeavingAndArrivingCard(
                        isFrom: true,
                        function: () {
                          debugPrint("bottomsheet");
                        }),
                  ],
                ),
                SizedBox(height: 2.h),
                AnimatedCrossFade(
                  firstChild: fisrtChild(),
                  secondChild: secondChild(),
                  crossFadeState: isOneWayTrip
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 500),
                  firstCurve: Curves.linearToEaseOut,
                ),
                SizedBox(height: 3.h),
                CustomElevatedButton(
                  buttonColor: MyThemeData.appblue,
                  myWidgets: const DefaultButtonText(text: "بحث"),
                  otpressFunction: () {
                    Navigator.pushNamed(
                        context, RoutNamesDart.rSeatReservation);
                  },
                ),
                SizedBox(height: 6.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  fisrtChild() {
    return Row(
      children: [
        TripTimePicker(function: () {
          debugPrint("timepicker");
        }),
      ],
    );
  }

  secondChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TripTimePicker(function: () {
          debugPrint("timepicker");
        }),
        SizedBox(width: 3.w),
        TripTimePicker(function: () {
          debugPrint("timepicker");
        }),
      ],
    );
  }

  Widget tripType(title, isoneWay) {
    return InkWell(
      onTap: () {
        !isoneWay
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
          color: isoneWay ? MyThemeData.appyellow : MyThemeData.appblue,
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
