import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';

class CustomElevatedButton extends StatelessWidget {
  final List<Widget> myWidgets;
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
    return ElevatedButton(
      onPressed: otpressFunction,
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        side: BorderSide(
          color:
              isSelected ?? false ? MyThemeData.textColor : Colors.transparent,
          width: 0.5.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        children: myWidgets,
      ),
    );
  }
}
