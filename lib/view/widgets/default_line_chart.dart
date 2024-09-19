/// Package import
import 'package:flutter/material.dart';
/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trafic_static_app/model/traffic_report_model.dart';
/// Local import
import '../../../../../model/sample_view.dart';
///Renders default line series chart
class LineDefault extends SampleView {
  ///Creates default line series chart
  const LineDefault({Key? key, required this.trafficModel}) : super(key: key);

  final TrafficReportModel? trafficModel;

  @override
  _LineDefaultState createState() => _LineDefaultState(trafficModel);
}

class _LineDefaultState extends SampleViewState {
  _LineDefaultState(this.trafficModel);

  final TrafficReportModel? trafficModel;

  @override
  Widget build(BuildContext context) {
    return _buildDefaultLineChart();
  }

  /// Get the cartesian chart with default line series
  SfCartesianChart _buildDefaultLineChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: isCardView ? '' : 'Inflation - Consumer price'),
      legend: Legend(
          isVisible: isCardView ? false : true,
          overflowMode: LegendItemOverflowMode.wrap),
      primaryXAxis: DateTimeAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 2,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}',
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(color: Colors.transparent)),
      series: _getDefaultLineSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<LineSeries<_ChartData, DateTime>> _getDefaultLineSeries() {
    final List<_ChartData> chartData = <_ChartData>[];

    for (int i = 0; i < trafficModel!.data!.visits!.length; i++) {
      chartData.add(_ChartData(
          DateTime.parse(trafficModel!.data!.visits![i][0].toString()),
          double.parse(trafficModel!.data!.visits![i][1].toString()),
          double.parse(trafficModel!.data!.visitors![i][1].toString())));
    }
    return <LineSeries<_ChartData, DateTime>>[
      LineSeries<_ChartData, DateTime>(
          animationDuration: 2500,
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          width: 2,
          name: 'Visitors',
       //   color:primaryColor ,
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, DateTime>(
          animationDuration: 2500,
          dataSource: chartData,
          width: 2,
          name: 'Visits',
      //    color: yellowColor,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);

  final DateTime x;
  final double y;
  final double y2;
}
