import 'package:get/get.dart';
import 'package:test_mobile_fe_ordo/models/key_performance_model.dart';

class KeyPerformanceController extends GetxController {
  final KeyPerformance = <KeyPerformanceModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    KeyPerformance.assignAll([
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
        percentage: "0%",
      ),
      KeyPerformanceModel(
        icon: "assets/icons/store.svg",
        iconColor: "purpleColor",
        titleKey: "Latest Lead",
        jumlahDeals: 69,
        percentage: "+7.5%",
      ),
      KeyPerformanceModel(
        icon: "assets/icons/flame.svg",
        iconColor: "lightRedColor",
        titleKey: "Hot Deals",
        jumlahDeals: 18,
        percentage: "-0.15%",
      ),
    ]);
  }
}
