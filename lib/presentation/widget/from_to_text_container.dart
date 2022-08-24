import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FromToTextContainer extends StatelessWidget {
  const FromToTextContainer({
    Key? key,
    this.from,
    this.to,
    this.date,
  }) : super(key: key);
  final String? from;
  final String? to;
  final String? date;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      // decoration: const BoxDecoration(
      // ),
      child: Column(
        children: const [
          Text("من : القاهره"),
          Text("الي : الاسكندريه"),
          Text("الخميس 32 مايو"),
        ],
      ),
    );
  }
}
