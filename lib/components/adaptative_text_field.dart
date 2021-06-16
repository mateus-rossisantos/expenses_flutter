import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function fn;
  final TextInputType keyboard;

  const AdaptativeTextField(
      {this.label,
      this.controller,
      this.fn,
      this.keyboard = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            placeholder: label,
            controller: controller,
            onSubmitted: fn,
            keyboardType: keyboard,
          )
        : TextField(
            decoration: InputDecoration(labelText: label),
            controller: controller,
            onSubmitted: fn,
            keyboardType: keyboard,
          );
  }
}
