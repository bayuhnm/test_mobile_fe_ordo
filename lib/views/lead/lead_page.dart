import 'package:flutter/material.dart';
import 'package:test_mobile_fe_ordo/config/colors.dart';
import 'package:test_mobile_fe_ordo/config/typography.dart';

class LeadPage extends StatelessWidget {
  const LeadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 170, child: Image.asset('assets/profile_pict/logo.png')),
          SizedBox(
            height: 30,
          ),
          SizedBox(
              width: 200,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  children: const [
                    TextSpan(text: "Sorry, our "),
                    TextSpan(
                      text: "Leaderboard Page",
                      style: TextStyle(
                        color: mainPurple,
                      ),
                    ),
                    TextSpan(text: " is currently under construction."),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
