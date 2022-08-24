import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/custom_text_feild.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';

class FromAndToWidget extends StatelessWidget {
  final bool isfrom;
  final Widget textfeildWidget;
  final String city;
  const FromAndToWidget({
    Key? key,
    required this.isfrom,
    required this.textfeildWidget,
    required this.city,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.w),
        color: MyThemeData.appblue,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: 2.h,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        // vertical: 2.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DefaultButtonText(text: isfrom ? "من" : "الي"),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 2.h),
            child: textfeildWidget,
          ),
          // CustomeTextFeild(
          //   textController: citynameController,
          //   feildText: "اسم المحافطه",
          //   withShadow: false,
          //   userInputType: TextInputType.name,
          // ),
          DefaultButtonText(text: city),
        ],
      ),
    );
  }
}
