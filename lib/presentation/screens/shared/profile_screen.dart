import 'package:flutter/material.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_cicular_image.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/widget/drawer.dart';
import 'package:testapp/presentation/widget/drawer_item.dart';
import 'package:testapp/presentation/widget/options_in_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text("الملف الشخصي"),
          actions: [
            InkWell(
              onTap: (() {
                Navigator.pushNamed(context, RoutNamesDart.rEditProfileScreen);
              }),
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: const Icon(Icons.edit),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OptionsInProfile(
                  text: 'مساعده',
                  route: '',
                  icons: const Icon(Icons.help_outline),
                ),
                OptionsInProfile(
                  text: 'الأعدادات',
                  route: '',
                  icons: const Icon(Icons.settings),
                ),
                OptionsInProfile(
                  text: 'التذاكر السابقة',
                  route: '',
                  icons: const Icon(Icons.history),
                )
              ],
            ),
            const Divider(
              color: MyThemeData.dappDarkblue,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.w),
                  child: const Icon(
                    Icons.person,
                    color: MyThemeData.dappDarkblue,
                  ),
                ),
                Text('Ahmed')
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.w),
                  child: const Icon(
                    Icons.phone_iphone,
                    color: MyThemeData.dappDarkblue,
                  ),
                ),
                Text('+20 1012457896')
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(3.w),
                  child: const Icon(
                    Icons.email_outlined,
                    color: MyThemeData.dappDarkblue,
                  ),
                ),
                Text('AhmedMohamed@gmail.com')
              ],
            ),
            const Divider(
              color: MyThemeData.dappDarkblue,
            ),
            DrawerItem(
                text: 'الحمايه و الخصوصيه',
                icons: const Icon(Icons.privacy_tip_outlined),
                route: 'route',
                color: MyThemeData.appDarkblue),
            DrawerItem(
                text: 'من نحن',
                icons: const Icon(Icons.info_outline),
                route: 'route',
                color: MyThemeData.appDarkblue),
            DrawerItem(
              text: 'تواصل معنا',
              icons: const Icon(Icons.contact_support_outlined),
              route: 'route',
              color: MyThemeData.appDarkblue,
            ),
          ],
        ),
      ),
    );
  }
}
