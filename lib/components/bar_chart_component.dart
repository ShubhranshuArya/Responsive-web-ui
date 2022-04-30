import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:responsive_dashboard_ui/config/responsive.dart';
import 'package:responsive_dashboard_ui/style/colors.dart';

class BarChartComponent extends StatelessWidget {
  const BarChartComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        borderData: FlBorderData(show: false),
        alignment: BarChartAlignment.spaceBetween,
        axisTitleData: FlAxisTitleData(leftTitle: AxisTitle(reservedSize: 20)),
        gridData: FlGridData(drawHorizontalLine: true, horizontalInterval: 30),
        titlesData: FlTitlesData(
            leftTitles: SideTitles(
              reservedSize: 30,
              getTextStyles: (value) =>
                   TextStyle(color: Colors.grey, fontSize:Responsive.isDesktop(context) ? 12 : 10),
              showTitles: true,
              getTitles: (value) {
                if (value == 0) {
                  return '0';
                } else if (value == 30) {
                  return '30k';
                } else if (value == 60) {
                  return '60k';
                } else if (value == 90) {
                  return '90k';
                } else {
                  return '';
                }
              },
            ),
            bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) =>
                    TextStyle(color: Colors.grey, fontSize: Responsive.isDesktop(context) ?12 : 10),
                getTitles: (value) {
                  // TextStyle
                  if (value == 0) {
                    return 'JAN';
                  } else if (value == 1) {
                    return 'FEB';
                  } else if (value == 2) {
                    return 'MAR';
                  } else if (value == 3) {
                    return 'APR';
                  } else if (value == 4) {
                    return 'MAY';
                  } else if (value == 5) {
                    return 'JUN';
                  } else if (value == 6) {
                    return 'JUL';
                  } else if (value == 7) {
                    return 'AUG';
                  } else if (value == 8) {
                    return 'SEP';
                  } else if (value == 9) {
                    return 'OCT';
                  } else if (value == 10) {
                    return 'NOV';
                  } else if (value == 11) {
                    return 'DEC';
                  } else {
                    return '';
                  }
                }) // SideTitles
            ),
        barGroups: List.generate(12, (index) => barGroup(index,50,context)),
      ),
      swapAnimationDuration: const Duration(milliseconds: 200),
      swapAnimationCurve: Curves.linear,
    );
  }

  BarChartGroupData barGroup(int x, double value,BuildContext context) => BarChartGroupData(
        x: x,
        barRods: [
          BarChartRodData(
            y: value,
            colors: [Colors.black],
            width: Responsive.isDesktop( context) ? 40 : 14,
            backDrawRodData: BackgroundBarChartRodData(
                y: 90, show: true, colors: [AppColors.barBg]),
          ),
        ],
      );
}
