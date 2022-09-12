import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/constants/constant_data.dart';

class CustomImageContainer extends StatelessWidget {
  final String? imagePath;
  final double? widthAndHeight;
  final bool withShadow;
  const CustomImageContainer({
    Key? key,
    required this.imagePath,
    required this.withShadow,
    this.widthAndHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthAndHeight ?? 50.w,
      height: widthAndHeight ?? 50.w,
      decoration: withShadow
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(2.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(2.w),
            ),
      // check for internet connection or bloc repo has data?
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2.w),
        child: imagePath != null
            ? Image.asset(
                imagePath!,
                fit: BoxFit.fill,
              )
            : Image.asset(
                ConstantData.noImageBus,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
