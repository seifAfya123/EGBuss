import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/drawer_item.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: MyThemeData.backGroundColor,
        child: Column(

          children: [
            Image.asset(
              'assets/images/splashImage2.png',
              width: 80.w,
              height: 20.h,
            ),
            const Divider(
              color: MyThemeData.dappDarkblue,
            ),
            DrawerItem(
                text: 'حجز',
                function: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, RoutNamesDart.rHomeScreen);
                },
                icons: const Icon(Icons.history),
                color: MyThemeData.dappblue),
            DrawerItem(
                text: 'الملف الشخصى',
                function: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, RoutNamesDart.rProfileScreen);
                },
                icons: const Icon(Icons.account_circle_outlined),
                color: MyThemeData.dappblue),
            DrawerItem(
                text: 'الأشعارات',
                function: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, RoutNamesDart.rNotificationsScreen);
                },
                icons: const Icon(Icons.notifications_none),
                color: MyThemeData.dappblue),
            DrawerItem(
              text: 'تذاكرك',
              function: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(
                    context, RoutNamesDart.rOldTicketsScreen);
              },
              icons: const Icon(CupertinoIcons.tickets,
                  color: MyThemeData.dappblue),
              color: MyThemeData.dappblue,
            ),
            Expanded(child: Container()),
            const Divider(
              color: MyThemeData.dappDarkblue,
            ),
            DrawerItem(
                text: 'تسجيل خروج',
                function: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, RoutNamesDart.rLoginScreen);
                },
                icons: const Icon(Icons.logout),
                color: MyThemeData.dappblue),
          ],
        ));

  }
}
