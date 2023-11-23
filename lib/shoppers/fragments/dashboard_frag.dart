import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:utopiamall/shoppers/fragments/favorites_frag_screen.dart';
import 'package:utopiamall/shoppers/fragments/home_frag_screen.dart';
import 'package:utopiamall/shoppers/fragments/order_frag_screen.dart';
import 'package:utopiamall/shoppers/fragments/profile_frag_screen.dart';
import 'package:utopiamall/shoppers/shopperPreferences/current_shopper.dart';


class DashboardFrag extends StatelessWidget {
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 4) {
      return "Good Night";
    } else if (hour < 12) {
      return "Good Morning";
    } else if (hour < 16) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  CurrentShopper _rememberCurrentShopper = Get.put(CurrentShopper());

  List<Widget> _fragmentScreens = [
    HomeFragmentScreen(),
    FavoritesFragmentScreen(),
    OrderFragmentScreen(),
    ProfileFragmentScreen(),
  ];

  List _navButtonsProps = [
    {
      "active_icon": Icons.home_filled,
      "non_active_icon": Icons.home_outlined,
      "label": "Home",
    },
    {
      "active_icon": Icons.favorite,
      "non_active_icon": Icons.favorite_border,
      "label": "Favorites",
    },
    {
      "active_icon": FontAwesomeIcons.boxOpen,
      "non_active_icon": FontAwesomeIcons.box,
      "label": "Orders",
    },
    {
      "active_icon": Icons.person_sharp,
      "non_active_icon": Icons.person_outline_sharp,
      "label": "Account",
    },
  ];

  RxInt _indexNumber = 0.obs;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CurrentShopper(),
      initState: (currentState) {
        _rememberCurrentShopper.getShopperInfo();
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Obx (
              () => _fragmentScreens[_indexNumber.value]
            ),
          ),
          bottomNavigationBar: Obx(
            () => BottomNavigationBar(
              currentIndex: _indexNumber.value,
              onTap: (value) {
                _indexNumber.value = value;
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white24,
              items: List.generate(4, (index) {
                var navBtnProp = _navButtonsProps[index];
                return BottomNavigationBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(navBtnProp["non_active_icon"]),
                  activeIcon: Icon(navBtnProp["active_icon"]),
                  label: navBtnProp["label"],
                );
              }),
            ),
          ),
        );
      },
    );
  }
} 