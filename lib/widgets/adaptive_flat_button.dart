import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptiveFlatButton extends StatelessWidget {
  final Function handle;
  final String text;

  AdaptiveFlatButton(this.handle, this.text);
  @override
  Widget build(BuildContext context) {
    return
        Platform.isIOS ? CupertinoButton(child: Text(
          this.text,
        ), onPressed: this.handle) : TextButton(
          onPressed: this.handle,
          child: Text(
            this.text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        );
  }
}
