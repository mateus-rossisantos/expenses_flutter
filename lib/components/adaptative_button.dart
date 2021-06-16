import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: onPressed,
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              textStyle:
                  TextStyle(color: Theme.of(context).textTheme.button.color),
            ),
            onPressed: onPressed,
            child: Text(label),
          );
  }
}
