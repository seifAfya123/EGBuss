import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:testapp/presentation/widget/drawer_item.dart';
import 'package:testapp/presentation/widget/from_and_to_widget.dart';
import 'package:testapp/presentation/widget/leaving_and_arriving_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController citynameController = TextEditingController();

  bool isOneWayTrip = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // drawer: Drawer(
        //     child: Column(
        //   children: [
        //     Image.asset(
        //       'assets/images/splashImage2.png',
        //       width: 60.w,
        //       height: 20.h,
        //     ),
        //     const Divider(
        //       color: MyThemeData.dappDarkblue,
        //     ),
        //     DrawerItem(
        //       text: 'حجز',
        //       route: RoutNamesDart.rHomeScreen,
        //       icons: const Icon(Icons.history),
        //       color: MyThemeData.dappblue,
        //     ),
        //     DrawerItem(
        //       text: 'الملف الشخصى',
        //       route: RoutNamesDart.rProfileScreen,
        //       icons: const Icon(Icons.account_circle_outlined),
        //       color: MyThemeData.dappblue,
        //     ),
        //     DrawerItem(
        //       text: 'الأشعارات',
        //       route: '',
        //       icons: const Icon(Icons.notifications_none),
        //       color: MyThemeData.dappblue,
        //     ),
        //     InkWell(
        //       onTap: () {},
        //       child: Row(
        //         children: [
        //           Padding(
        //             padding: EdgeInsets.all(3.w),
        //             child: const Icon(
        //               CupertinoIcons.tickets,
        //               color: MyThemeData.dappblue,
        //             ),
        //           ),
        //           const Text('تذاكرك')
        //         ],
        //       ),
        //     ),
        //     SizedBox(
        //       height: 30.h,
        //     ),
        //     const Divider(
        //       color: MyThemeData.dappDarkblue,
        //     ),
        //     DrawerItem(
        //       text: 'تسجيل خروج',
        //       route: RoutNamesDart.rLoginScreen,
        //       icons: const Icon(Icons.logout),
        //       color: MyThemeData.dappblue,
        //     ),
        //   ],
        // )),
        appBar: AppBar(
          title: const Text("ابحث عن رحلتك"),
        ),
        body: Column(
          children: [
            SizedBox(height: 5.h),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
              // height: 15.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.w),
                color: MyThemeData.appblue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  tripType("ذهاب", isOneWayTrip),
                  tripType("ذهاب و عوده", !isOneWayTrip),
                ],
              ),
            ),
            const FromAndToWidget(
              isfrom: true,
              textfeildWidget: Text("sda\ndas"),
              city: "الماظه",
            ),
            !isOneWayTrip
                ? const FromAndToWidget(
                    isfrom: false,
                    textfeildWidget: Text("dsa"),
                    city: "الموقف الجديد")
                : Container(),
            const LeavingAndArrivingCard(isFrom: true),
            !isOneWayTrip
                ? const LeavingAndArrivingCard(isFrom: false)
                : Container(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
              child: CustomElevatedButton(
                myWidgets: const DefaultButtonText(text: "الرحلات المتاحه"),
                otpressFunction: () {
                  Navigator.pushNamed(
                      context, RoutNamesDart.rAvailableTripsScreen);
                },
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
        setState(() {
          isOneWayTrip = !isOneWayTrip;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: isYellow ? MyThemeData.appyellow : MyThemeData.appblue,
        ),
        child: Text(title),
      ),
    );
  }
}
