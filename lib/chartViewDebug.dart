import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:open_weight/application_localization.dart';

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

class PieChartSample1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Indicator(
                  color: const Color(0xfffde725),
                  text: AppLocalizations.of(context).proteins,
                  isSquare: false,
                  size: touchedIndex == 1 ? 18 : 16,
                  textColor: touchedIndex == 1 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: const Color(0xff21918c),
                  text: AppLocalizations.of(context).carbohydrates,
                  isSquare: false,
                  size: touchedIndex == 1 ? 18 : 16,
                  textColor: touchedIndex == 2 ? Colors.black : Colors.grey,
                ),
                Indicator(
                  color: const Color(0xff440154),
                  text: AppLocalizations.of(context).lipids,
                  isSquare: false,
                  size: touchedIndex == 2 ? 18 : 16,
                  textColor: touchedIndex == 3 ? Colors.black : Colors.grey,
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      startDegreeOffset: 180,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 12,
                      centerSpaceRadius: 30,
                      sections: showingSections(10, 20, 30)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      int proteins, int carbohydrates, int lipids) {
    final double opacity = 1;
    return List.from([
      PieChartSectionData(
        color: const Color(0xfffde725).withOpacity(opacity),
        value: proteins.toDouble(),
        title: '',
        radius: 30,
        titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xff044d7c)),
        titlePositionPercentageOffset: 0.55,
      ),
      PieChartSectionData(
        color: const Color(0xff21918c).withOpacity(opacity),
        value: carbohydrates.toDouble(),
        title: '',
        radius: 30,
        titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xff90672d)),
        titlePositionPercentageOffset: 0.55,
      ),
      PieChartSectionData(
        color: const Color(0xff440154).withOpacity(opacity),
        value: lipids.toDouble(),
        title: '',
        radius: 30,
        titleStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color(0xff4c3788)),
        titlePositionPercentageOffset: 0.6,
      )
    ]);
  }
}

class PieChartPage extends StatelessWidget {
  final Color barColor = Colors.white;
  final Color barBackgroundColor = const Color(0xff72d8bf);
  final double width = 22;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffeceaeb),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ListView(
          children: <Widget>[
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Pie Chart',
                  style: TextStyle(
                      color: Color(
                        0xff333333,
                      ),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            PieChartSample1(),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
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
        body: PieChartPage());
  }
}
