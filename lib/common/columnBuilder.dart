/*  This code is part of the open calorie tracker project. 
 *   This application helps you to track the consumed calories on a daily basis.
 *   Copyright (C) 2020. Adrien FAURE
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <https://www.gnu.org/licenses/>. */

// https://gist.github.com/slightfoot/a75d6c368f1b823b594d9f04bf667231
import 'package:flutter/material.dart';

class CustomColumnBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final int itemCount;

  final initialData;

  const CustomColumnBuilder({
    Key key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.initialData,
    this.mainAxisAlignment: MainAxisAlignment.start,
    this.mainAxisSize: MainAxisSize.max,
    this.crossAxisAlignment: CrossAxisAlignment.center,
    this.verticalDirection: VerticalDirection.down,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: this.crossAxisAlignment,
        mainAxisSize: this.mainAxisSize,
        mainAxisAlignment: this.mainAxisAlignment,
        verticalDirection: this.verticalDirection,
        children: ListTile.divideTiles(
          context: context,
          color: Colors.black54,
          tiles: List.generate(
                  this.itemCount, (index) => this.itemBuilder(context, index))
              .toList(),
        ).toList());
  }
}
