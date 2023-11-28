import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:utopiamall/shoppers/auth/signin_screen.dart';
import 'package:utopiamall/shoppers/shopperPreferences/current_shopper.dart';
import 'package:utopiamall/shoppers/shopperPreferences/shopper_preferences.dart';


class ProfileFragmentScreen extends StatelessWidget {

  final CurrentShopper _currentShopper = Get.put(CurrentShopper());

  signOutShopper () async {
    var resultRes = await Get.dialog(
      AlertDialog(
        backgroundColor: Colors.grey,
        title: Row(
          children: [
            Icon(
              Icons.power_settings_new_sharp,
              size: 24,
              color: Colors.red,
            ),
            SizedBox(width: 8),
            Text(
              "Log out",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: const Text(
          "Are you sure you want a break?\nConfirm if you’d like to to sign out…",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            }, 
            child: const Text (
              "Go back",
              style: TextStyle(
                color: Colors.black
              ),
            )
          ),
          TextButton(
            onPressed: () {
              Get.back(result: "See you soon! You’re now logged out.");
            }, 
            child: const Text (
              "Confirm, logout",
              style: TextStyle(
                color: Colors.black
              ),
            )
          ),
        ],
      ),
    );

    if(resultRes == "See you soon! You’re now logged out.") {
      RememberShopperPrefs.clearShopperInfo().then((value) {
        Get.off(LoginScreen());

        Fluttertoast.showToast(
          msg: "See you soon! You’re now logged out.",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
          webBgColor: "#008080",
          webPosition: "right",
          webShowClose: true,
        );
      });
    }
  }

  Widget shopperInfoProf(IconData iconData, String shopperData){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 30,
            color: Colors.black,
          ),
          const SizedBox(width: 16,),
          Text(
            shopperData,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [

        Center(
          child: Container(
            width: 360,
            height: 360,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                "images/nappy-00m.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(height: 20,),

        shopperInfoProf(Icons.person_sharp, _currentShopper.shopper.shopper_username),

        const SizedBox(height: 20,),

        shopperInfoProf(Icons.email_sharp, _currentShopper.shopper.shopper_email),

        const SizedBox(height: 20,),

        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {
                signOutShopper();
              },
              borderRadius: BorderRadius.circular(32),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                child: Text(
                  "Sign out",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}