import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/constants/app_strings.dart';
import 'package:testapp/constants/const_test_data.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
import 'package:testapp/presentation/widget/const_widget.dart';
import 'package:testapp/presentation/widget/custom_drop_down_list.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/custom_image_container.dart';
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
  final fromStationEC = TextEditingController();
  final fromGOVEC = TextEditingController();
  final toGOVEC = TextEditingController();
  final toStationEC = TextEditingController();
  final dateEC = TextEditingController();
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
                const Expanded(
                  child: CustomImageContainer(
                      imagePath: AppStrings.busImg, withShadow: false),
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
                        governrateName: toGOVEC.text,
                        stationName: toStationEC.text,
                        function: () {
                          // debugPrint("bottomsheet");
                          ConstWidgets.botomshet(
                            context,
                            ListView.builder(
                              itemCount: stations.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  child: MyDropDownList(
                                    onChangeFunction: () {
                                      setState(() {});
                                    },
                                    governrateController: toGOVEC,
                                    stationcontroller: toStationEC,
                                    items: stations[index].stations,
                                    title: stations[index].governrate,
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                    SizedBox(width: 3.w),
                    LeavingAndArrivingCard(
                        governrateName: fromGOVEC.text,
                        stationName: fromStationEC.text,
                        isFrom: true,
                        function: () {
                          ConstWidgets.botomshet(
                            context,
                            ListView.builder(
                              itemCount: stations.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 1.h),
                                  child: MyDropDownList(
                                    onChangeFunction: () {
                                      setState(() {});
                                    },
                                    governrateController: fromGOVEC,
                                    stationcontroller: fromStationEC,
                                    items: stations[index].stations,
                                    title: stations[index].governrate,
                                  ),
                                );
                              },
                            ),
                          );
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
                // SizedBox(height: 6.h),
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
