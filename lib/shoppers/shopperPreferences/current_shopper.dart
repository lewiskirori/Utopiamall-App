import 'package:utopiamall/shoppers/model/shopper.dart';
import 'package:get/get.dart';
import 'package:utopiamall/shoppers/shopperPreferences/shopper_preferences.dart';

class CurrentShopper extends GetxController {
  Rx<Shopper> _currentShopper = Shopper(0,'','','').obs;

  Shopper get shopper => _currentShopper.value;

  getShopperInfo() async {
    Shopper? getShopperInfoFromLocalStrorage = await RememberShopperPrefs.readShopperInfo();
    _currentShopper.value = getShopperInfoFromLocalStrorage!;
  }
}