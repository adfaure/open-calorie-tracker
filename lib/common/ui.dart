import 'package:flutter/material.dart';

final appBgColor = Color(0xFFe3e3e3);

class BoxedContainer extends StatelessWidget {
  final Widget child;
  BoxedContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 0, // soften the shadow
              spreadRadius: 1, //extend the shadow
            )
          ],
        ),
        child: child);
  }
}