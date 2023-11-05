import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:test_mobile_fe_ordo/config/colors.dart';
import 'package:test_mobile_fe_ordo/config/typography.dart';

class LineChartRevenue extends StatefulWidget {
  const LineChartRevenue({super.key});

  @override
  State<LineChartRevenue> createState() => _LineChartRevenueState();
}

class _LineChartRevenueState extends State<LineChartRevenue> {
  List<Color> gradientColors = [
    Color(0xFF7864E6),
    Color(0xFF9447B9),
    Color(0xFF9447B9).withOpacity(0),
  ];

  bool showAvg = false;

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: whiteColor,
      fontFamily: 'Poppins',
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = const Text('Mon', style: style);
        break;
      case 2:
        text = const Text('Tue', style: style);
        break;
      case 3:
        text = const Text('Wed', style: style);
        break;
      case 4:
        text = const Text('Thu', style: style);
        break;
      case 5:
        text = const Text('Fri', style: style);
        break;
      case 6:
        text = const Text('Sat', style: style);
        break;
      case 7:
        text = const Text('Sun', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  String selectedView = 'Daily';

  List<FlSpot> dailyData = [
    FlSpot(0, 25),
    FlSpot(1, 30),
    FlSpot(2, 28),
    FlSpot(3, 22),
    FlSpot(4, 25),
    FlSpot(5, 28),
    FlSpot(6, 26),
    FlSpot(7, 25),
    FlSpot(8, 26),
  ];

  List<FlSpot> weeklyData = [
    FlSpot(0, 22),
    FlSpot(1, 25),
    FlSpot(2, 27),
    FlSpot(3, 29),
    FlSpot(4, 28),
    FlSpot(5, 31),
    FlSpot(6, 30),
    FlSpot(7, 25),
    FlSpot(8, 28),
  ];

  List<FlSpot> monthlyData = [
    FlSpot(0, 30),
    FlSpot(1, 29),
    FlSpot(2, 32),
    FlSpot(3, 31),
    FlSpot(4, 30),
    FlSpot(5, 28),
    FlSpot(6, 27),
    FlSpot(7, 26),
    FlSpot(8, 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(left: 30, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Revenue",
                    style: whiteTextStyle.copyWith(
                        fontSize: 12, letterSpacing: -0.4),
                  ),
                  Text(
                    "Rp 257.500.000",
                    style: whiteTextStyle.copyWith(
                        fontSize: 20,
                        letterSpacing: -0.3,
                        fontWeight: semiBold),
                  )
                ],
              ),
              PopupMenuButton<String>(
                offset: Offset(-15, 35),
                // constraints: BoxConstraints(
                //   minHeight: 99,
                //   maxHeight: 99,
                // ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                icon: const Icon(
                  Icons.more_horiz_rounded,
                  color: whiteColor,
                ),
                onSelected: (value) {
                  setState(() {
                    selectedView = value!;
                  });
                },
                itemBuilder: (BuildContext context) {
                  return ['Daily', 'Weekly', 'Monthly'].map((view) {
                    return PopupMenuItem<String>(
                      value: view,
                      child: Text(
                        view,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 11,
                          color:
                              selectedView == view ? mainPurple : Colors.black,
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        AspectRatio(
          aspectRatio: 1.60,
          child: LineChart(
            mainData(selectedView),
          ),
        ),
      ],
    );
  }

  LineChartData mainData(String selectedView) {
    List<FlSpot>? dataPoints;

    if (selectedView == 'Daily') {
      dataPoints = dailyData;
    } else if (selectedView == 'Weekly') {
      dataPoints = weeklyData;
    } else if (selectedView == 'Monthly') {
      dataPoints = monthlyData;
    }

    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            // getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: darkPurple,
          tooltipRoundedRadius: 6,
          tooltipPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final value = barSpot.y;
              final formattedValue = 'Rp. ${value.toStringAsFixed(0)}0.000';
              return LineTooltipItem(
                formattedValue,
                TextStyle(
                    color: whiteColor,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: medium),
              );
            }).toList();
          },
        ),
      ),
      minX: 0,
      maxX: 8,
      minY: 0,
      maxY: 35,
      lineBarsData: [
        LineChartBarData(
          spots: dataPoints!,
          isCurved: true,
          color: whiteColor,
          barWidth: 2.5,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: true,
            checkToShowDot: (spot, barData) {
              if (spot.x == 0 || spot.x == 8) {
                return false;
              } else {
                return true;
              }
            },
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors.map((color) => color).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
