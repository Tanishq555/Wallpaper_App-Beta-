import 'package:flutter/material.dart';
import 'package:splash_screen/model/gobal.dart';
import 'package:splash_screen/widget/fullscreen.dart';

Widget brandName() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        'RegX',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      
    ],
  );
}

