import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
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
        appBar: AppBar(
          title: Text("ابحث عن رحلتك"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutNamesDart.rProfileScreen,
                );
              },
              icon: const Icon(Icons.menu),
            ),
          ],
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
            const LeavingAndArrivingCard(isArriving: true),
            !isOneWayTrip
                ? const LeavingAndArrivingCard(isArriving: false)
                : Container(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
              child: CustomElevatedButton(
                myWidgets: [DefaultButtonText(text: "الرحلات المتاحه")],
                otpressFunction: () {
                  Navigator.pushReplacementNamed(
                      context, RoutNamesDart.rAvailableTripsScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tripType(title, mybool) {
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
          color: mybool ? MyThemeData.primaryColor : MyThemeData.appblue,
        ),
        child: Text(title),
      ),
    );
  }
}
