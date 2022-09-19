import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/business_logic/register_cubit/register_cubit.dart';
import 'package:testapp/constants/end_points.dart';

import 'dart:ui' as ui;

import 'package:testapp/data/local/cache_helper.dart';
import 'package:testapp/data/network/requests/login%20and%20reqister%20req/owner_register_request.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_elevated_button.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';
import 'package:testapp/presentation/widget/loading_data_widget.dart';

class OtpScreen extends StatelessWidget {
  final OwnerRegisterRequest owner;
  OtpScreen({
    Key? key,
    required this.owner,
  }) : super(key: key);
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  var myfromKey = GlobalKey<FormState>();
  String lang =
      CacheHelper.getDataFromSharedPreference(key: appLanguageSharedKey);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyThemeData.backGroundColor,
        body: Container(
          padding: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h),
              // title
              Text(
                "تاكيد الكود",
                style: Theme.of(context).textTheme.headline1!,
              ),
              SizedBox(height: 2.h),
              // message
              Text(
                "تم ارسال رقم اليك من فضلك ادخله لتاكيد انه انت",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .color!
                        .withOpacity(0.5)),
              ),
              SizedBox(height: 2.h),
              // phone number
              Row(
                children: [
                  Text(
                    "${owner.phone![0]}${owner.phone![1]}${owner.phone![2]} *******${owner.phone![owner.phone!.length - 2]}${owner.phone![owner.phone!.length - 1]}",
                    style: Theme.of(context).textTheme.bodyText1,
                    textDirection: ui.TextDirection.ltr,
                  ),
                ],
              ), //otp code
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                textDirection: ui.TextDirection.ltr,
                children: lang == "en"
                    ? [
                        otpBox(context, c1),
                        otpBox(context, c2),
                        otpBox(context, c3),
                        otpBox(context, c4),
                      ]
                    : [
                        otpBox(context, c4),
                        otpBox(context, c3),
                        otpBox(context, c2),
                        otpBox(context, c1),
                      ],
              ),
              SizedBox(height: 4.h),
              // buttons
              BlocProvider(
                create: (context) => RegisterCubit(),
                child: BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is SuccessState) {
                      Navigator.pushReplacementNamed(
                          context, RoutNamesDart.rHomeScreen);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const LoadingDataWidget();
                    }
                    var mycubit = BlocProvider.of<RegisterCubit>(context);
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 40.w,
                              child: CustomElevatedButton(
                                myWidgets:
                                    const DefaultButtonText(text: "تاكيد"),
                                otpressFunction: () {
                                  verify(mycubit, owner.phone!);
                                  Navigator.pushReplacementNamed(
                                      context, RoutNamesDart.rHomeScreen);
                                },
                              ),
                            ),
                            SizedBox(
                              width: 40.w,
                              child: CustomElevatedButton(
                                buttonColor: Colors.white,
                                myWidgets: DefaultButtonText(
                                    text: "الغاء",
                                    newstyle:
                                        Theme.of(context).textTheme.bodyText1),
                                otpressFunction: () => Navigator.pop(context),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 3.h),
                        TextButton(
                          onPressed: () {},
                          child: DefaultButtonText(
                            text: "اعاده الارسال",
                            newstyle: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(color: MyThemeData.appblue),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  verify(RegisterCubit mycubit, String phoneNumber) async {
    String otpCode = c1.text.toString() +
        c2.text.toString() +
        c3.text.toString() +
        c4.text.toString();
    if (lang != 'en') {
      otpCode = c4.text + c3.text + c2.text + c1.text;
    } else {
      otpCode = c1.text + c2.text + c3.text + c4.text;
    }
    if (otpCode.length == 4) {
      mycubit.verifyOtpCode(otpCode, phoneNumber);
    } else {}
  }

  otpBox(BuildContext context, TextEditingController textConttroler) {
    return SizedBox(
      height: 15.w,
      width: 15.w,
      child: TextField(
        onChanged: (value) {
          if (value.length == 1) {
            lang == "en"
                ? FocusScope.of(context).nextFocus()
                : FocusScope.of(context).previousFocus();
          }
        },
        onTap: () {
          if (textConttroler.text.isNotEmpty) {
            textConttroler.text = "";
          }
        },
        textAlign: TextAlign.center,
        controller: textConttroler,
        cursorColor: MyThemeData.appblue,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: MyThemeData.appyellow),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.red),
          ),
          hintText: "0",
          hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .color!
                  .withOpacity(0.5)),
        ),
        style: Theme.of(context).textTheme.headline2,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
