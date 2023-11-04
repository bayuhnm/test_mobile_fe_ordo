import 'package:get/get.dart';
import 'package:test_mobile_fe_ordo/models/key_performance_model.dart';

class KeyPerformanceController extends GetxController {
  final leaderboardsData = <KeyPerformanceModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    leaderboardsData.assignAll([
      KeyPerformanceModel(
        icon: "assets/icons/store.svg",
        iconColor: "purpleColor",
        titleKey: "Total Lead",
        jumlahDeals: 57,
        percentage: "+3.5%",
      ),
      KeyPerformanceModel(
        icon: "assets/icons/flame.svg",
        iconColor: "lightRedColor",
        titleKey: "Hot Lead",
        jumlahDeals: 28,
        percentage: "-1.25%",
      ),
      KeyPerformanceModel(
        icon: "assets/icons/checklist.svg",
        iconColor: "green1Color",
        titleKey: "Total Deals",
        jumlahDeals: 100,
        percentage: "+1.25%",
      ),
      KeyPerformanceModel(
        icon: "assets/icons/store.svg",
        iconColor: "purpleColor",
        titleKey: "Total Lead",
        jumlahDeals: 57,
        percentage: "3.5%",
      ),
      KeyPerformanceModel(
        icon: "assets/icons/flame.svg",
        iconColor: "lightRedColor",
        titleKey: "Hot Lead",
        jumlahDeals: 28,
        percentage: "1.25%",
      ),
    ]);
  }
}
