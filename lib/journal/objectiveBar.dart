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
import 'package:step_progress_indicator/step_progress_indicator.dart';

class ObjectiveBar extends StatelessWidget {
  final int value;
  final int objective;
  final String title;
  final double lineHeight;
  final colorOk;
  final colorNotOk = Colors.red;
  final leading;
  final double scaleHeader;

  var onTap;

  ObjectiveBar({
    Key key,
    @required this.value,
    @required this.objective,
    @required this.title,
    this.scaleHeader = 1.2,
    this.lineHeight = 35,
    this.leading,
    this.onTap,
    this.colorOk = Colors.blue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var percent = this.value / this.objective * 100;
    var colorUnselected = percent > 100 ? colorNotOk : Colors.grey.shade300;

    var totalStep = percent < 100 ? 100 : percent;
    var percentValue = percent > 100 ? 100 : percent;

    return Column(children: [
      _getHeader(percent.toInt()),
      GestureDetector(
          onTap: onTap,
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: StepProgressIndicator(
                totalSteps: totalStep.toInt(),
                currentStep: percentValue.toInt(),
                size: 20,
                padding: 0,
                selectedColor: colorOk,
                unselectedColor: colorUnselected,
              )))
    ]);
  }

  _getHeader(int percentage) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: Row(
          children: <Widget>[
            Text(
              "$title: $value / $objective",
              textScaleFactor: this.scaleHeader,
            ),
            Expanded(child: Container()),
            Text(
              "$percentage %",
              textScaleFactor: this.scaleHeader,
            ),
          ],
        ));
  }
}
