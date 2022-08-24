import 'package:flutter/material.dart';

class DefaultButtonText extends StatelessWidget {
  final String text;
  final TextStyle? newStyle;
  const DefaultButtonText({
    Key? key,
    required this.text,
    this.newStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: newStyle ?? Theme.of(context).textTheme.headline6,
    );
  }
}
