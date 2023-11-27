import 'package:flutter/material.dart';


class ProfileFragmentScreen extends StatelessWidget {

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
      children: [

        Center(
          child: Image.asset(
            "images/miriam-001w.png",
            width: 240,
          ),
        ),

        const SizedBox(height: 20,),

        shopperInfoProf(Icons.person_sharp, "Account Username"),

        const SizedBox(height: 20,),

        shopperInfoProf(Icons.email_sharp, "accountemail@domain.com"),

        Center(
          child: Material(
            color: Colors.redAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {

              },
              borderRadius: BorderRadius.circular(32),
              child: Padding(
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