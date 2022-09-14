import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/generated/i18n.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget myWidgets;
  final VoidCallback otpressFunction;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? buttonColor;
  final bool? isSelected;
  const CustomElevatedButton({
    Key? key,
    required this.myWidgets,
    required this.otpressFunction,
    this.mainAxisAlignment,
    this.buttonColor,
    this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: otpressFunction,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          side: BorderSide(
            color: isSelected ?? false
                ? MyThemeData.appDarkblue
                : Colors.transparent,
            width: 0.8.w,
          ),
        ),
        child: myWidgets,
      ),
    );
  }
}
