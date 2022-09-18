import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';

class LeavingAndArrivingCard extends StatelessWidget {
  const LeavingAndArrivingCard({
    Key? key,
    required this.isFrom,
    required this.function,
    required this.stationName,
    required this.governrateName,
  }) : super(key: key);
  final bool isFrom;
  final Function function;
  final String stationName;
  final String governrateName;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => function(),
        child: Container(
          height: governrateName.isEmpty ? 10.h : null,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.w),
            color: MyThemeData.appyellow,
          ),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_drop_down_outlined,
                    color: MyThemeData.mywhite,
                  ),
                  Text(
                    isFrom ? "من" : "الي",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              governrateName.isEmpty ? Container() : Text(governrateName),
              stationName.isEmpty
                  ? Container()
                  : DefaultButtonText(text: stationName)
            ],
          ),
        ),
      ),
    );
  }
}
