import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testapp/business_logic/provider/user_guest_provider.dart';
import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/view/body_white_container.dart';
import 'package:testapp/presentation/widget/appbar_title_text.dart';
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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: MyThemeData.appblue,
    ));
    user_guest isGuest = Provider.of<user_guest>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const AppbarTitleText(titleText: "الملف الشخصي"),
          actions: [
            InkWell(
              onTap: (() {
                if (isGuest.isGuest == false) {
                  Navigator.pushNamed(
                      context, RoutNamesDart.rEditProfileScreen);
                } else {
                  Navigator.pushNamed(context, RoutNamesDart.rLoginFirstScreen);
                }
              }),
              child: Padding(
                padding: EdgeInsets.all(5.w),
                child: const Icon(Icons.edit),
              ),
            )
          ],
        ),
        body: BodyWhiteContainer(
          bodyChild: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OptionsInProfile(
                    ontap: () {},
                    paymentOptions: PaymentMethod.choosed,
                    text: 'مساعده',
                    icons: const Icon(Icons.help_outline),
                    color: MyThemeData.appyellow,
                  ),
                  OptionsInProfile(
                    ontap: () {
                      Navigator.pushNamed(
                          context, RoutNamesDart.rSettingsScreen);
                    },
                    paymentOptions: PaymentMethod.choosed,
                    text: 'الأعدادات',
                    icons: const Icon(Icons.settings),
                    color: MyThemeData.appyellow,
                  ),
                  OptionsInProfile(
                    ontap: () {
                      if (isGuest.isGuest == false) {
                        Navigator.pushNamed(
                            context, RoutNamesDart.rOldTicketsScreen);
                      } else {
                        Navigator.pushNamed(
                            context, RoutNamesDart.rLoginFirstScreen);
                      }
                    },
                    paymentOptions: PaymentMethod.choosed,
                    text: 'التذاكر السابقة',
                    icons: const Icon(Icons.history),
                    color: MyThemeData.appyellow,
                  )
                ],
              ),
              const Divider(
                color: MyThemeData.dappDarkblue,
              ),
              isGuest.isGuest == false
                  ? userData()
                  : Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 4.h),
                              child: Text('برجاء تسجيل الدخول اولا')),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: CustomElevatedButton(
                                buttonColor: MyThemeData.dappblue,
                                myWidgets: DefaultButtonText(
                                  text: 'تسجيل الدخول',
                                ),
                                otpressFunction: () {}),
                          )
                        ],
                      ),
                    ),
              const Divider(
                color: MyThemeData.dappDarkblue,
              ),
              DrawerItem(
                  text: 'الحمايه و الخصوصيه',
                  icons: const Icon(Icons.privacy_tip_outlined),
                  function: () {
                    Navigator.pushNamed(context, RoutNamesDart.rprivacyPolicy);
                  },
                  color: MyThemeData.appDarkblue),
              DrawerItem(
                  text: 'من نحن',
                  icons: const Icon(Icons.info_outline),
                  function: () {
                    Navigator.pushNamed(context, RoutNamesDart.rAboutUsScreen);
                  },
                  color: MyThemeData.appDarkblue),
              DrawerItem(
                text: 'تواصل معنا',
                icons: const Icon(Icons.contact_support_outlined),
                function: () {
                  Navigator.pushNamed(context, RoutNamesDart.rContactUsScreen);
                },
                color: MyThemeData.appDarkblue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget userData() {
    return Column(
      children: [
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
      ],
    );
  }
}
