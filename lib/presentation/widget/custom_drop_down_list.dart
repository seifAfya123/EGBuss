import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';

class MyDropDownList extends StatefulWidget {
  final TextEditingController governrateController;
  final TextEditingController stationcontroller;
  final Function onChangeFunction;
  final List<String> items;
  final String title;
  const MyDropDownList({
    Key? key,
    required this.governrateController,
    required this.stationcontroller,
    required this.items,
    required this.title,
    required this.onChangeFunction,
  }) : super(key: key);
  @override
  State<MyDropDownList> createState() => _MyDropDownListState();
}

class _MyDropDownListState extends State<MyDropDownList> {
  String? choosenValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        color: MyThemeData.appGery,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: choosenValue,
          hint: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: widget.items.map(buildMenuItem).toList(),
          onChanged: (String? newValue) {
            setState(() {
              choosenValue = newValue;
              widget.stationcontroller.text = newValue.toString();
              widget.governrateController.text = widget.title.toString();
              widget.onChangeFunction();
              Navigator.pop(context);
            });
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      );
}
