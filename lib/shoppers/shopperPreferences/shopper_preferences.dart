import 'dart:convert';

import 'package:utopiamall/shoppers/model/shopper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberShopperPrefs {
  
  // Remember shopper info
  static Future<void> storeRememberShopper(Shopper shopperInfo) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String shopperJsonData = jsonEncode(shopperInfo.toJson());
    await preferences.setString("currentShopper", shopperJsonData);
  }
}