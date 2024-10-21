// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CategoryProductChart extends StatelessWidget {
  const CategoryProductChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 250,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 10,
              barTouchData: BarTouchData(enabled: true),
              borderData: FlBorderData(show: true),
              barGroups: [
                BarChartGroupData(
                    x: 0, barRods: [BarChartRodData(toY: 5, color: Colors.blue)]),
                BarChartGroupData(
                    x: 1,
                    barRods: [BarChartRodData(toY: 7, color: Colors.green)]),
                BarChartGroupData(
                    x: 2, barRods: [BarChartRodData(toY: 3, color: Colors.red)]),
                BarChartGroupData(
                    x: 3,
                    barRods: [BarChartRodData(toY: 6, color: Colors.orange)]),
              ],
            ),
          ),
        ));
  }
}
