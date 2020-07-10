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
      children: List.generate(
          this.itemCount, (index) => this.itemBuilder(context, index)).toList(),
    );
  }
}