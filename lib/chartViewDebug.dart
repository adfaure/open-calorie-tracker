import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GaugeChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GaugeChart(this.seriesList, {this.animate});


  @override
  Widget build(BuildContext context) {
    return charts.PieChart(seriesList,
        behaviors: [charts.DatumLegend()],
        // animate: animate,
        // Configure the width of the pie slices to 30px. The remaining space in
        // the chart will be left as a hole in the center. Adjust the start
        // angle and the arc length of the pie so it resembles a gauge.
        defaultRenderer: new charts.ArcRendererConfig(
            // arcRendererDecorators: [new charts.ArcLabelDecorator()],
            startAngle: pi,
            arcLength: 20 / 10 * pi,
            arcRatio: 0.5));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<GaugeSegment, String>> createSampleData() {
    final data = [
      new GaugeSegment('Lipide', 100),
      new GaugeSegment('Protéine', 110),
      new GaugeSegment('Glucide', 1),
    ];

    return [
      new charts.Series<GaugeSegment, String>(
        id: 'Segments',
        labelAccessorFn: (elem, i) => elem.segment,
        domainFn: (GaugeSegment segment, _) => segment.segment,
        measureFn: (GaugeSegment segment, _) => segment.size,
        data: data,
      )
    ];
  }
}

/// Sample data type.
class GaugeSegment {
  final String segment;
  final int size;

  GaugeSegment(this.segment, this.size);
}

/// Focus on a modifiable food entry.
class ChartView extends StatelessWidget {
  final scaleFactor = 1.2;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
        ),
        body: Column(
          children: [
            Container(
                width: 100, height: 150, child: GaugeChart(GaugeChart.createSampleData()))
          ],
        ));
  }
}
