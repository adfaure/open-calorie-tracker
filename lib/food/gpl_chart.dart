import 'dart:math';

import 'package:flutter/material.dart';

import '../application_localization.dart';
import 'package:charts_flutter_cf/charts_flutter_cf.dart' as charts;

class GPLChart extends StatefulWidget {
  int carbohydrates;
  int lipids;
  int proteins;
  // I need to get the parent context to be able to reach the AppLocalization class...
  BuildContext context;

  GPLChart(
      {Key key,
      @required this.proteins,
      @required this.carbohydrates,
      @required this.lipids,
      @required this.context})
      : super(key: key);

  @override
  _GPLChartState createState() =>
      _GPLChartState(this.proteins, this.carbohydrates, this.lipids);
}

class _GPLChartState extends State<GPLChart> {
  final bool animate;

  List<charts.Series> seriesList;
  int carbohydrates;
  int lipids;
  int proteins;

  _GPLChartState(this.proteins, this.carbohydrates, this.lipids,
      {this.animate});

  @override
  void initState() {
    super.initState();
    seriesList =
        createSampleData(widget.context, proteins, lipids, carbohydrates);
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(seriesList,
        behaviors: [charts.DatumLegend(showMeasures: true)],
        // behaviors: [],
        // animate: animate,
        // Configure the width of the pie slices to 30px. The remaining space in
        // the chart will be left as a hole in the center. Adjust the start
        // angle and the arc length of the pie so it resembles a gauge.
        defaultRenderer: charts.ArcRendererConfig(
            // arcRendererDecorators: [new charts.ArcLabelDecorator()],
            startAngle: pi,
            arcLength: 20 / 10 * pi,
            arcRatio: 0.5));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<GaugeSegment, String>> createSampleData(
      BuildContext context, int proteins, int lipids, int carbohydrates) {
    final data = [
      GaugeSegment('Lipids', lipids),
      GaugeSegment('Carbohydrates', carbohydrates),
      GaugeSegment('Proteins', proteins),
    ];
    debugPrint("ddata: ${data}");

    return [
      charts.Series<GaugeSegment, String>(
        id: 'Segments',
        labelAccessorFn: (elem, i) =>
            AppLocalizations.of(context).dynamicNutriment(elem.segment),
        colorFn: (elem, value) {
          switch (elem.segment) {
            case "Lipids":
              return charts.Color.fromHex(code: "#fde725");
            case "Proteins":
              return charts.Color.fromHex(code: "#21918c");
            case "Carbohydrates":
              return charts.Color.fromHex(code: "#440154");
            default:
              return charts.Color.black;
          }
        },
        domainFn: (GaugeSegment segment, _) =>
            AppLocalizations.of(context).dynamicNutriment(segment.segment),
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
