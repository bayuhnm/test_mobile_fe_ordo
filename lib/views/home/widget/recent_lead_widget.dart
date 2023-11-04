import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_mobile_fe_ordo/config/colors.dart';
import 'package:test_mobile_fe_ordo/config/typography.dart';

class RecentLeadCard extends StatelessWidget {
  const RecentLeadCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 72,
      padding: EdgeInsets.only(top: 9, bottom: 9, left: 13),
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
                color: Color(0xFF7864E6).withOpacity(.12),
                blurRadius: 19,
                spreadRadius: 0,
                offset: Offset(0, -1))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/profile_pict/recent1.png'),
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
                      Image.asset(
                        "assets/icons/calendar.png", // Replace with the path to your custom icon
                        width: 10,
                        height: 10,
                        color: grey2Color, // Color for the icon
                      ),
                      SizedBox(
                        width: 2,
                      ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 22,
                width: 83,
                decoration: BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        'assets/icons/star.svg',
                        color: Colors.white,
                        height: 11,
                        width: 11,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "New Lead",
                      style: whiteTextStyle.copyWith(
                          fontSize: 10, letterSpacing: -0.3),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                "Rp. 13.000.000",
                style: blackTextStyle.copyWith(
                    fontSize: 12, fontWeight: medium, letterSpacing: -0.4),
              )
            ],
          )
        ],
      ),
    );
  }
}
