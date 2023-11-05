import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_mobile_fe_ordo/config/colors.dart';
import 'package:test_mobile_fe_ordo/config/typography.dart';
import 'package:test_mobile_fe_ordo/views/commission/commission_page.dart';
import 'package:test_mobile_fe_ordo/views/home/home_page.dart';
import 'package:test_mobile_fe_ordo/views/lead/lead_page.dart';
import 'package:test_mobile_fe_ordo/views/profile/profile_page.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs; // To keep track of the selected menu item.

  void selectPage(int index) {
    selectedIndex.value = index;
  }
}

class DashboardPage extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());

  // Define your SVG assets for active and inactive icons here.
  final List<String> activeIcons = [
    'assets/icons/home_solid.svg',
    'assets/icons/notepad_solid.svg',
    'assets/icons/clock_solid.svg',
    'assets/icons/profile_solid.svg',
  ];

  final List<String> inactiveIcons = [
    'assets/icons/home_outline.svg',
    'assets/icons/notepad_outline.svg',
    'assets/icons/clock_outline.svg',
    'assets/icons/profile_outline.svg',
  ];

  final List<String> labels = ['Home', 'Lead', 'Commission', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final selectedIndex = controller.selectedIndex.value;
        return IndexedStack(
          index: selectedIndex,
          children: [
            HomePage(),
            LeadPage(),
            CommissionPage(),
            ProfilePage(),
          ],
        );
      }),
      bottomNavigationBar: Obx(() {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomAppBar(
            color: darkPurple,
            height: 90,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
            shape: const CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                final isActive = index == controller.selectedIndex.value;
                return GestureDetector(
                  onTap: () {
                    controller.selectPage(index);
                  },
                  child: SizedBox(
                    width: 81,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            isActive
                                ? activeIcons[index]
                                : inactiveIcons[index],
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            labels[index],
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: isActive ? medium : regular,
                              color: isActive
                                  ? whiteColor
                                  : whiteColor.withOpacity(0.81),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      }),
    );
  }
}
