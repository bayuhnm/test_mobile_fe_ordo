import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_mobile_fe_ordo/config/colors.dart';
import 'package:test_mobile_fe_ordo/config/typography.dart';

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 72,
      padding: EdgeInsets.only(top: 9, bottom: 9, left: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "1",
                style:
                    mainTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/profile_pict/lead2.png'),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Shinta Alexandra",
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
                        "31 January 2023",
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
                "45",
                style: mainTextStyle.copyWith(
                    fontSize: 12, fontWeight: semiBold, letterSpacing: -0.3),
              ),
              SizedBox(width: 2,),
              Text(
                "Deal",
                style: greyTextStyle.copyWith(
                    fontSize: 10 , letterSpacing: -0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
