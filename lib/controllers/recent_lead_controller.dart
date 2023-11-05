import 'package:get/get.dart';
import 'package:test_mobile_fe_ordo/models/recent_lead_model.dart';

class RecentLeadController extends GetxController {
  final recentLead = <RecentLeadModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    recentLead.assignAll([
      RecentLeadModel(
        icon: "assets/icons/star.svg",
        label: "New Lead",
        imageUrl: "assets/profile_pict/recent1.png",
        name: "Shinta Alexandra",
        date: "31 January 2023",
        revenue: "13.000.000",
      ),
      RecentLeadModel(
        icon: "assets/icons/flame.svg",
        label: "Hot Lead",
        imageUrl: "assets/profile_pict/recent2.png",
        name: "Vita Arsalansia",
        date: "31 January 2023",
        revenue: "13.000.000",
      ),
      RecentLeadModel(
        icon: "assets/icons/snow.svg",
        label: "Cold Lead",
        imageUrl: "assets/profile_pict/recent3.png",
        name: "Meriko Yolanda",
        date: "31 January 2023",
        revenue: "13.000.000",
      ),
    ]);
  }
}
