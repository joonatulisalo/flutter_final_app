import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() => runApp(const SecondRoute());

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Second Route',
      home: MySecondHomePage(title: 'Demo'),
    );
  }
}

class MySecondHomePage extends StatefulWidget {
  const MySecondHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MySecondHomePage> createState() => _MySecondHomePageState();
}

class _MySecondHomePageState extends State<MySecondHomePage> {
  late List<DGData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCircularChart(
        title: ChartTitle(text: 'Suosituimmat merkit (prosentteina %)'),
        legend:
            Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
        tooltipBehavior: _tooltipBehavior,
        series: <CircularSeries>[
          PieSeries<DGData, String>(
              dataSource: _chartData,
              xValueMapper: (DGData data, _) => data.brand,
              yValueMapper: (DGData data, _) => data.percent,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              enableTooltip: true)
        ],
      ),
    ));
  }

  List<DGData> getChartData() {
    final List<DGData> chartData = [
      DGData('Innova', 30.3),
      DGData('Discmania', 28.4),
      DGData('Latitude 64', 6.7),
      DGData('Prodigy', 6.7),
      DGData('Discraft', 5.6),
      DGData('Westside', 5.1),
      DGData('Dynamic discs', 3.6),
      DGData('MVP', 1.0),
      DGData('Prodiscus', 0.6),
      DGData('Viking discs', 0.4)
    ];
    return chartData;
  }
}

class DGData {
  DGData(this.brand, this.percent);
  final String brand;
  final double percent;
}
