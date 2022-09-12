import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:testapp/presentation/widget/default_button_text.dart';

class LeavingAndArrivingCard extends StatelessWidget {
  const LeavingAndArrivingCard({
    Key? key,
    required this.isFrom,
    required this.function,
  }) : super(key: key);
  final bool isFrom;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => function(),
        child: Container(
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
                    isFrom ? "from" : "To",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              Text(isFrom ? "وقت المغادره" : "وقت الوصول"),
              const DefaultButtonText(text: "الثلاثاء 14/5")
            ],
          ),
        ),
      ),
    );
  }
}
