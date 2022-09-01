import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/drawer_item.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Image.asset(
          'assets/images/splashImage2.png',
          width: 60.w,
          height: 20.h,
        ),
        const Divider(
          color: MyThemeData.dappDarkblue,
        ),
        DrawerItem(
            text: 'حجز',
            route: RoutNamesDart.rHomeScreen,
            icons: const Icon(Icons.history),
            color: MyThemeData.dappblue),
        DrawerItem(
            text: 'الملف الشخصى',
            route: RoutNamesDart.rProfileScreen,
            icons: const Icon(Icons.account_circle_outlined),
            color: MyThemeData.dappblue),
        DrawerItem(
            text: 'الأشعارات',
            route: '',
            icons: const Icon(Icons.notifications_none),
            color: MyThemeData.dappblue),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(3.w),
                child: const Icon(
                  CupertinoIcons.tickets,
                  color: MyThemeData.dappblue,
                ),
              ),
              const Text('تذاكرك')
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        const Divider(
          color: MyThemeData.dappDarkblue,
        ),
        DrawerItem(
            text: 'تسجيل خروج',
            route: RoutNamesDart.rLoginScreen,
            icons: const Icon(Icons.logout),
            color: MyThemeData.dappblue),
      ],
    ));
  }
}
