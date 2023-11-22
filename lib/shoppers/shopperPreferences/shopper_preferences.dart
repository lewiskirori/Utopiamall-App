import 'dart:convert';

import 'package:utopiamall/shoppers/model/shopper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberShopperPrefs {
  
  // Remember shopper info
  static Future<void> storeShopperInfo(Shopper shopperInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String shopperJsonData = jsonEncode(shopperInfo.toJson());
    await preferences.setString("currentShopper", shopperJsonData);
  }

  // Retreive shopper info
  static Future<Shopper?> readShopperInfo() async {
    Shopper? currentShopperInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? shopperInfo = preferences.getString("currentShopper");
    if(shopperInfo != null) {
      Map<String, dynamic> shopperDataMap = jsonDecode(shopperInfo);
      currentShopperInfo = Shopper.fromJson(shopperDataMap);
    }
    return currentShopperInfo;
  }
}