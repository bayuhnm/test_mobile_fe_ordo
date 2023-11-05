import 'package:get/get.dart';
import 'package:test_mobile_fe_ordo/models/leaderboard_model.dart';

class LeaderboardController extends GetxController {
  final leaderboardList = <LeaderboardModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    leaderboardList.assignAll([
      LeaderboardModel(
        imageUrl: "assets/profile_pict/lead1.png",
        name: "Shinta Alexandra",
        date: "31 January 2023",
        deals: 45,
      ),
      LeaderboardModel(
        imageUrl: "assets/profile_pict/lead2.png",
        name: "Jhonatan Zegwin",
        date: "23 January 2023",
        deals: 42,
      ),
      LeaderboardModel(
        imageUrl: "assets/profile_pict/lead3.png",
        name: "Vita Arsalansia",
        date: "15 January 2023",
        deals: 34,
      ),
      LeaderboardModel(
        imageUrl: "assets/profile_pict/lead4.png",
        name: "Meriko Yolanda",
        date: "17 January 2023",
        deals: 30,
      ),
      LeaderboardModel(
        imageUrl: "assets/profile_pict/lead5.png",
        name: "Higuain Morelan",
        date: "22 January 2023",
        deals: 25,
      ),
    ]);
  }
}
