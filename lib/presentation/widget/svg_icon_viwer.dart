import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class SvgIconViwer extends StatelessWidget {
  final double? iconWidth;
  final double? iconHeight;
  final String iconPath;
  final Color? iconColor;
  const SvgIconViwer({
    Key? key,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: iconWidth ?? 70.w,
      height: iconWidth ?? 70.w,
      child: iconColor == null
          ? SvgPicture.asset(
              iconPath,
              semanticsLabel: 'Acme Logo',
            )
          : SvgPicture.asset(
              iconPath,
              color: iconColor,
              semanticsLabel: 'Acme Logo',
            ),
    );
  }
}
