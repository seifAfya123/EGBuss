import 'package:flutter/material.dart';

class DefaultButtonText extends StatelessWidget {
  final String text;
  final TextStyle? newstyle;
  final Color? newColor;
  const DefaultButtonText({
    Key? key,
    required this.text,
    this.newColor,
    this.newstyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: newstyle ??
              Theme.of(context).textTheme.headline6!.copyWith(color: newColor),
        ),
      ],
    );
  }
}
