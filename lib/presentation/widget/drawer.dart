import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/business_logic/provider/user_guest_provider.dart';
import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/drawer_item.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    user_guest isGuest = Provider.of<user_guest>(context, listen: false);
    return Drawer(
        backgroundColor: MyThemeData.backGroundColor,
        child: Column(
          children: [
            Image.asset(
              ConstantData.egbusspng,
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
                  if (isGuest.isGuest == false) {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(
                        context, RoutNamesDart.rNotificationsScreen);
                  } else {
                    Navigator.pop(context);
                    Navigator.pushNamed(
                        context, RoutNamesDart.rLoginFirstScreen);
                  }
                },
                icons: const Icon(Icons.notifications_none),
                color: MyThemeData.dappblue),
            DrawerItem(
              text: 'تذاكرك',
              function: () {
                if (isGuest.isGuest == false) {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, RoutNamesDart.rMyTicketsScreen);
                } else {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, RoutNamesDart.rLoginFirstScreen);
                }
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
