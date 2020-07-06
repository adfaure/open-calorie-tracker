import 'package:flutter/material.dart';

final appBgColor = Color(0xFFe3e3e3);

Widget boxedContainer(Widget child) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.white70,
            blurRadius: 10, // soften the shadow
            spreadRadius: 1, //extend the shadow
          )
        ],
      ),
      child: child);
}