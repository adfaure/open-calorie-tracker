import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:open_weight/common/ui.dart';

import '../application_localization.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}

class GPLChart extends StatelessWidget {
  final int carbohydrates;
  final int lipids;
  final int proteins;
  // I need to get the parent context to be able to reach the AppLocalization class...
  final BuildContext context;

  GPLChart(
      {Key key,
      @required this.proteins,
      @required this.carbohydrates,
      @required this.lipids,
      @required this.context})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Indicator(
              color: proteinsColor,
              text: AppLocalizations.of(context).proteins,
              isSquare: false,
            ),
            Indicator(
              color: carbohydratesColor,
              text: AppLocalizations.of(context).carbohydrates,
              isSquare: false,
            ),
            Indicator(
              color: lipidsColor,
              text: AppLocalizations.of(context).lipids,
              isSquare: false,
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: Text(
              proteins.toString(),
              textAlign: TextAlign.center,
            )),
            Expanded(
                child: Text(
              carbohydrates.toString(),
              textAlign: TextAlign.center,
            )),
            Expanded(
                child: Text(
              lipids.toString(),
              textAlign: TextAlign.center,
            )),
          ],
        ),
        Expanded(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: PieChart(
              PieChartData(
                  startDegreeOffset: 180,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 2,
                  centerSpaceRadius: 25,
                  sections: showingSections()),
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    final double opacity = 1;
    return List.from([
      PieChartSectionData(
        color: proteinsColor.withOpacity(opacity),
        value: proteins.toDouble(),
        radius: 22,
        showTitle: false,
        titleStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: const Color(0xff044d7c)),
        titlePositionPercentageOffset: 0.55,
      ),
      PieChartSectionData(
        color: carbohydratesColor.withOpacity(opacity),
        value: carbohydrates.toDouble(),
        radius: 22,
        showTitle: false,
        titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xff90672d)),
        titlePositionPercentageOffset: 0.55,
      ),
      PieChartSectionData(
        color: lipidsColor.withOpacity(opacity),
        value: lipids.toDouble(),
        radius: 22,
        showTitle: false,
        titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xff4c3788)),
        titlePositionPercentageOffset: 0.6,
      )
    ]);
  }
}

/// Sample data type.
class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}
