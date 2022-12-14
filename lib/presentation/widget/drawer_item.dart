import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';

import 'package:testapp/presentation/styles/my_theme_data.dart';

class DrawerItem extends StatelessWidget {
  String text;
  Icon icons;
  // String route;
  Color color;
  VoidCallback? function;
  DrawerItem({
    Key? key,
    required this.text,
    required this.icons,
    // required this.route,
    required this.color,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(3.w),
            child: Icon(
              icons.icon,
              color: color,
            ),
          ),
          Text(text)
        ],
      ),
    );
  }
}
