import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_mobile_fe_ordo/config/colors.dart';
import 'package:test_mobile_fe_ordo/config/typography.dart';

class RecentLeadCard extends StatelessWidget {
  const RecentLeadCard({
    super.key,
    required this.imageUrl,
    required this.icon,
    required this.label,
    required this.name,
    required this.date,
    required this.revenue,
  });

  final String label;
  final String imageUrl;
  final String icon;
  final String name;
  final String date;
  final String revenue;

  Color getColorForIcon(String icon) {
    switch (icon) {
      case "assets/icons/star.svg":
        return purpleColor;
      case "assets/icons/flame.svg":
        return lightRedColor;
      case "assets/icons/snow.svg":
        return orangeColor;
      default:
        return redColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 72,
      padding: EdgeInsets.only(top: 9, bottom: 9, left: 13),
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     whiteColor.withOpacity(0),
        //     whiteColor,
        //     whiteColor.withOpacity(0),
        //   ],
        // ),
        // boxShadow: [
        //   BoxShadow(
        //       color: Color(0xFF7864E6).withOpacity(.12),
        //       blurRadius: 19,
        //       spreadRadius: 0,
        //       offset: Offset(0, -1))
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
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
                      Image.asset(
                        "assets/icons/calendar.png", // Replace with the path to your custom icon
                        width: 15,
                        height: 15,
                        color: grey2Color, // Color for the icon
                      ),
                      SizedBox(
                        width: 2,
                      ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 22,
                width: 83,
                decoration: BoxDecoration(
                    color: getColorForIcon(icon),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        icon,
                        color: Colors.white,
                        height: 11,
                        width: 11,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      label,
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
                "Rp ${revenue}",
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
