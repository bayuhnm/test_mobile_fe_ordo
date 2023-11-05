import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_mobile_fe_ordo/config/colors.dart';
import 'package:test_mobile_fe_ordo/config/typography.dart';

class LeaderboardCard extends StatelessWidget {
  LeaderboardCard(
      {super.key,
      required this.position,
      required this.imageUrl,
      required this.name,
      required this.date,
      required this.deals});

  final String imageUrl;
  final String position;
  final String name;
  final String date;
  final int deals;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 72,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.only(top: 9, bottom: 9, left: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
                child: Text(
                  position,
                    textAlign: TextAlign.center,
                  style: mainTextStyle.copyWith(
                      fontSize: 22, fontWeight: semiBold),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 45,
                height: 45,
                margin: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(imageUrl),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium, letterSpacing: -0.4),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        date,
                        style: greyTextStyle.copyWith(
                            fontSize: 11,
                            fontWeight: regular,
                            letterSpacing: -0.4),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                deals.toString(),
                style: mainTextStyle.copyWith(
                    fontSize: 12, fontWeight: semiBold, letterSpacing: -0.3),
              ),
              SizedBox(
                width: 2,
              ),
              Text(
                "Deals",
                style:
                    greyTextStyle.copyWith(fontSize: 10, letterSpacing: -0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
