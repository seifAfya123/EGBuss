import 'package:flutter/material.dart';

class ErrorSnackBar extends SnackBar {
  final String errorText;
  ErrorSnackBar({
    Key? key,
    required this.errorText,
  }) : super(
          key: key,
          content: Text(errorText),
          backgroundColor: Colors.red,
          duration: const Duration(milliseconds: 1500),
        );
}
