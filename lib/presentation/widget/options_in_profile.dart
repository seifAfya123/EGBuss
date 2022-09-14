import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/constants/constant_data.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';

class OptionsInProfile extends StatelessWidget {
  Icon icons;
  String text;
  Function ontap;
  Color? color;
  PaymentMethod paymentOptions;
  OptionsInProfile({
    Key? key,
    required this.icons,
    required this.text,
    this.color,
    required this.paymentOptions,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.w),
        color: paymentOptions == PaymentMethod.choosed
            ? MyThemeData.appyellow
            : MyThemeData.appblue,
      ),
      height: 15.h,
      width: 25.w,
      child: InkWell(
        onTap: (() => ontap()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons.icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
