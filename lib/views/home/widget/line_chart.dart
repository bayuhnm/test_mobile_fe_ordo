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
    const Color(0xFF8C38AF),
    const Color(0xFF9936A9),
    const Color(0xFF9447B9).withOpacity(0),
  ];

  bool showAvg = false;

  Widget bottomTitleWidgets(String selectedView, double value, TitleMeta meta) {
    const style = TextStyle(
      color: whiteColor,
      fontFamily: 'Poppins',
      fontSize: 12,
    );
    Widget text;
    switch (selectedView) {
      case 'Daily':
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
        break;
      case 'Weekly':
        switch (value.toInt()) {
          case 1:
            text = const Text('W1', style: style);
            break;
          case 2:
            text = const Text('W2', style: style);
            break;
          case 3:
            text = const Text('W3', style: style);
            break;
          case 4:
            text = const Text('W4', style: style);
            break;
          case 5:
            text = const Text('W1', style: style);
            break;
          case 6:
            text = const Text('W2', style: style);
            break;
          case 7:
            text = const Text('W3', style: style);
            break;
          default:
            text = const Text('', style: style);
            break;
        }
        break;
      case 'Monthly':
        switch (value.toInt()) {
          case 1:
            text = const Text('Jan', style: style);
            break;
          case 2:
            text = const Text('Feb', style: style);
            break;
          case 3:
            text = const Text('Mar', style: style);
            break;
          case 4:
            text = const Text('Apr', style: style);
            break;
          case 5:
            text = const Text('May', style: style);
            break;
          case 6:
            text = const Text('Jun', style: style);
            break;
          case 7:
            text = const Text('Jul', style: style);
            break;
          default:
            text = const Text('', style: style);
            break;
        }
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
    FlSpot(0, 5),
    FlSpot(1, 10),
    FlSpot(2, 15),
    FlSpot(3, 20),
    FlSpot(4, 25),
    FlSpot(5, 30),
    FlSpot(6, 32),
    FlSpot(7, 33),
    FlSpot(8, 34),
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
                offset: const Offset(-15, 35),
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
                            color: selectedView == view
                                ? mainPurple
                                : Colors.black,
                          ),
                        ));
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
        Center(
          child: IndicatorWidget(),
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
            getTitlesWidget: (value, meta) {
              return bottomTitleWidgets(selectedView, value, meta);
            },
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
          tooltipPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
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
            getDotPainter: (spot, percent, barData, index) =>
                FlDotCirclePainter(
                    radius: 4.5,
                    color: whiteColor,
                    strokeWidth: 1,
                    strokeColor: whiteColor),
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

class IndicatorWidget extends StatelessWidget {
  final int itemCount;
  final int activeIndex;

  IndicatorWidget({
    this.itemCount = 3,
    this.activeIndex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) {
          return Container(
            width: 25,
            height: 4,
            margin: EdgeInsets.symmetric(horizontal: 2, vertical: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: index == activeIndex
                  ? whiteColor
                  : whiteColor.withOpacity(0.25),
            ),
          );
        },
      ),
    );
  }
}
