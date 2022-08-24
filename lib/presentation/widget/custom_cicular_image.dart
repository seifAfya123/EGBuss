import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/constants/app_strings.dart';

class CustomCicularImage extends StatelessWidget {
  final String? marketImg;
  final double? imgRadius;
  const CustomCicularImage({
    Key? key,
    this.marketImg,
    this.imgRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(),
      width: imgRadius ?? 20.w,
      height: imgRadius ?? 20.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.5,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        image: marketImg != null
            ? DecorationImage(
                image: NetworkImage(marketImg!),
                fit: BoxFit.fill,
              )
            : DecorationImage(
                image: AssetImage(AppStrings.humanPlaceHolder),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
