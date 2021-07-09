import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

import 'anaSayfa.dart';



class grafikSayfa extends StatefulWidget {
  grafikSayfa({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _grafikSayfaState createState() => _grafikSayfaState();
}

class _grafikSayfaState extends State<grafikSayfa> {
  List<SkorData> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  Future<bool> _onBackPressed() {

    return showDialog(
        context: context,
        builder: (context) => anaSayfa()
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
          child: Scaffold(
              body: SfCartesianChart(
                title: ChartTitle(text: 'Skor Grafiğiniz'),
                legend: Legend(isVisible: true),
                tooltipBehavior: _tooltipBehavior,
                series: <ChartSeries>[
                  LineSeries<SkorData, double>(
                      name: 'Skor',
                      dataSource: _chartData,
                      xValueMapper: (SkorData skor, _) => skor.oyunsayisi,
                      yValueMapper: (SkorData skor, _) => skor.skor,
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      enableTooltip: true)
                ],
                primaryXAxis: NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                ),
                primaryYAxis: NumericAxis(
                    labelFormat: '{value}',
                    numberFormat: NumberFormat.decimalPattern()),
              ))),
    );
  }

  List<SkorData> getChartData() {
    final List<SkorData> chartData = [
      SkorData(1, 25),
      SkorData(2, 12),
      SkorData(3, 24),
      SkorData(4, 18),
      SkorData(5, 30),
      SkorData(6, 10),
      SkorData(7, 22),
      SkorData(8, 35),
      SkorData(9, 12),
      SkorData(10, 14),

    ];
    return chartData;
  }
}

class SkorData {
  SkorData(this.oyunsayisi, this.skor);
  final double oyunsayisi;
  final double skor;
}
