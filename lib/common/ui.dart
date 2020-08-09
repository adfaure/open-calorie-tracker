/*  This file is part of the open calorie tracker project. 
 *  This application helps you to track the consumed calories on a daily basis.
 *  Copyright (C) 2020. Adrien FAURE
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>. */

import 'package:flutter/material.dart';

final appBgColor = Color(0xFFe3e3e3);
final redTheme = Color(0xFFe21c21);

final Map<int, Color> appColor = {
  50: Color.fromRGBO(226, 28, 33, .1),
  100: Color.fromRGBO(226, 28, 33, .2),
  200: Color.fromRGBO(226, 28, 33, .3),
  300: Color.fromRGBO(226, 28, 33, .4),
  400: Color.fromRGBO(226, 28, 33, .5),
  500: Color.fromRGBO(226, 28, 33, .6),
  600: Color.fromRGBO(226, 28, 33, .7),
  700: Color.fromRGBO(226, 28, 33, .8),
  800: Color.fromRGBO(226, 28, 33, .9),
  900: Color.fromRGBO(226, 28, 33, 1),
};

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