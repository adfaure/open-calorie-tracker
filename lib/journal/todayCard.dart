import 'package:flutter/material.dart';

class DayCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 35,
        color: Colors.white,
        child: Row(
          children: [
            Icon(
              Icons.navigate_before,
              color: Colors.blue,
              size: 36.0,
            ),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: Text("c'est maintenant"))),
            Icon(
              Icons.navigate_next,
              color: Colors.blue,
              size: 36.0,
            ),
          ],
        ));
  }
}
