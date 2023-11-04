import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:test_mobile_fe_ordo/config/colors.dart';
import 'package:test_mobile_fe_ordo/config/typography.dart';
import 'package:test_mobile_fe_ordo/controllers/key_performance_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keyPerformanceController = Get.put(KeyPerformanceController());

  PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int nextIndex = _pageController.page!.round();
      if (currentIndex != nextIndex) {
        setState(() {
          currentIndex = nextIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width,
              color: mainPurple,
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10, left: 30),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Container(
                                padding: EdgeInsets.only(bottom: 1),
                                margin: EdgeInsets.only(right: 5),
                                width: 15,
                                child:
                                    Image.asset('assets/icons/barchart.png')),
                          ),
                          TextSpan(
                            text: "Key Performance Indicator",
                            style: blackTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: medium,
                              letterSpacing: -0.3,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Positioned(
                        bottom: 20,
                        left: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: List.generate(
                              keyPerformanceController.leaderboardsData.length -
                                  2, (index) {
                            return Container(
                              width: 44,
                              height: 3,
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: index == currentIndex + 1
                                    ? purpleColor
                                    : Color(0xFFEFEAEA),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        height: 150,
                        // padding: EdgeInsets.only(left: 10),
                        child: Obx(
                          () => ListView.builder(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            itemCount: keyPerformanceController
                                .leaderboardsData.length,
                            itemBuilder: (context, index) {
                              EdgeInsets margin;
                              if (index == 0) {
                                // Indeks pertama
                                margin = EdgeInsets.only(
                                    bottom: 40, top: 10, left: 30);
                              } else {
                                // Indeks lainnya
                                margin = EdgeInsets.only(
                                    bottom: 40, top: 10, left: 10);
                              }
                              final leaderboard = keyPerformanceController
                                  .leaderboardsData[index];

                              Color getColorForIcon(String icon) {
                                switch (icon) {
                                  case "assets/icons/store.svg":
                                    return purpleColor;
                                  case "assets/icons/flame.svg":
                                    return lightRedColor;
                                  case "assets/icons/checklist.svg":
                                    return green1Color;
                                  default:
                                    return orangeColor;
                                }
                              }

                              return Container(
                                height: 95,
                                width: 120,
                                margin: margin,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xFF7864E6)
                                              .withOpacity(.12),
                                          blurRadius: 19,
                                          spreadRadius: 0,
                                          offset: Offset(0, 9))
                                    ]),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 21,
                                          width: 21,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: getColorForIcon(
                                                leaderboard.icon),
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              leaderboard.icon,
                                              color: Colors.white,
                                              height: 11,
                                              width: 11,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          leaderboard.titleKey,
                                          style: blackTextStyle.copyWith(
                                            fontSize: 10,
                                            letterSpacing: -0.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${leaderboard.jumlahDeals}",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 27,
                                          fontWeight: semiBold,
                                          letterSpacing: -0.7),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Last month",
                                          style: greyTextStyle.copyWith(
                                              fontSize: 9, letterSpacing: -0.4),
                                        ),
                                        Text(
                                          "${leaderboard.percentage}",
                                          style: TextStyle(
                                              color: leaderboard.percentage
                                                      .contains("-")
                                                  ? Colors.red
                                                  : Colors.black,
                                              fontSize: 9,
                                              fontWeight: medium,
                                              letterSpacing: -0.4),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recent Lead",
                                style: blackTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: medium,
                                  letterSpacing: -0.3,
                                )),
                            Container(
                              height: 21,
                              width: 21,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: purpleColor.withOpacity(0.10),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                  color: mainPurple,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 72,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 13),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      whiteColor.withOpacity(0),
                                      whiteColor,
                                      whiteColor.withOpacity(0),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color(0xFF7864E6).withOpacity(.12),
                                        blurRadius: 19,
                                        spreadRadius: 0,
                                        offset: Offset(0, -1))
                                  ]),
                              child: Row(children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                        'assets/profile_pict/recent1.png'),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Shinta Alexandra",
                                      style: blackTextStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: medium,
                                          letterSpacing: -0.4),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Shinta Alexandra",
                                          style: blackTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: medium,
                                              letterSpacing: -0.4),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ]),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Leaderboards",
                            style: blackTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: medium,
                              letterSpacing: -0.3,
                            )),
                        Container(
                          height: 21,
                          width: 21,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: purpleColor.withOpacity(0.10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: mainPurple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 500,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
