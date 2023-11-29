import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:utopiamall/api_conn/api_conn.dart';
import 'package:utopiamall/shoppers/auth/signup_screen.dart';
import 'package:http/http.dart' as http;
import 'package:utopiamall/shoppers/fragments/dashboard_frag.dart';
import 'package:utopiamall/shoppers/model/shopper.dart';
import 'package:utopiamall/shoppers/shopperPreferences/shopper_preferences.dart';

class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  bool isLoading = false;

  String getGreetings() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 16) {
      return "Good Afternoon";
    } else if (hour >= 16 && hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  loginShopperNow() async{
    try {
      var res = await http.post(
        Uri.parse(API.signIn),
        body: {
          "shopper_email": emailController.text.trim(),
          "shopper_password": passwordController.text.trim(),
        },
      );

      if(res.statusCode == 200){
        var resBodyOfSignIn = jsonDecode(res.body);
        if(resBodyOfSignIn['success'] == true){
          Fluttertoast.showToast(
            msg: "${getGreetings()}!\nYou’re now signed in.",
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

          Shopper shopperInfo = Shopper.fromJson(resBodyOfSignIn["shopperData"]);

          // Conserve shopper info
          await RememberShopperPrefs.storeShopperInfo(shopperInfo);

          Future.delayed(Duration(milliseconds: 2000), (){
            Get.to(DashboardFrag());
          });
        } else {
          Fluttertoast.showToast(
            msg: "Wrong email or password. Please try again.",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red.shade800,
            textColor: Colors.white,
            fontSize: 16.0,
            webBgColor: "#FF0000",
            webPosition: "right",
            webShowClose: true,
          );
        }
      }
    } catch(errorMsg) {
      print("Oops! Something went wrong :: " + errorMsg.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Color shadowColor = MaterialColor(0xFFB0188E, {
      50: Color(0xFFE8C4DB),
      100: Color(0xFFD29BC8),
      200: Color(0xFFB97CB3),
      300: Color(0xFF9E579A),
      400: Color(0xFF8B398D),
      500: Color(0xFFB0188E),
      600: Color(0xFF950681),
      700: Color(0xFF7E0676),
      800: Color(0xFF6A056C),
      900: Color(0xFF51045C),
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, cons)
        {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  // Sign in screen header
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "images/rdne--login.jpg",
                    ),
                  ),

                  // Sign in body
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.all(
                          Radius.circular(60),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
                        child: Column(
                          children: [
                            
                            // Sign in form
                            Form(
                              key: formKey,
                              child: Column(
                                children: [

                                  // Heading
                                  Container(
                                    child: const Text(
                                      "Welcome back",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 16,),

                                  // Sub-heading
                                  Container(
                                    child: const Text(
                                      "Glad to see you again!",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 16,),

                                  // Email Address
                                  TextFormField(
                                    controller: emailController,
                                    validator: (val) => val == "" ? "Enter a valid email address." : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.email_sharp,
                                        color: Colors.black,
                                      ),
                                      hintText: "Email Address",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                          color: Colors.white60,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 6,
                                      ),
                                      fillColor: Colors.white,
                                      filled: true,
                                    ),
                                  ),
                  
                                  const SizedBox(height: 18,),
                  
                                  // Password
                                  Obx(
                                    ()=> TextFormField(
                                      controller: passwordController,
                                      obscureText: isObsecure.value,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Don't forget to enter your password.";
                                        }
                                        if (val.length < 8) {
                                          return "Your password must contain at least 8 characters.";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.lock_sharp,
                                          color: Colors.black,
                                        ),
                                        suffixIcon: Obx(
                                          () => Container(
                                            width: 40,
                                            child: ClipOval(
                                              child: TextButton(
                                                onPressed: () {
                                                  isObsecure.value = !isObsecure.value;
                                                },
                                                child: Icon(
                                                  isObsecure.value ? Icons.visibility_off_sharp :  Icons.visibility_sharp,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        hintText: "Password",
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(
                                            color: Colors.white60,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                          vertical: 6,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    ),
                                  ),
                  
                                  const SizedBox(height: 18,),
                  
                                  // Sign in button
                                  Material(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: () async {
                                        if(formKey.currentState!.validate()){
                                          setState(() {
                                            isLoading = true;
                                          });
                                          
                                          // Credential validation
                                          await loginShopperNow();

                                          setState(() {
                                            isLoading = false;
                                          });
                                        }
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                        child: isLoading
                                          ? SizedBox(
                                              width: 23,
                                              height: 23,
                                              child: CircularProgressIndicator(
                                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                              ),
                                            )
                                            : Text(
                                                "Sign In",
                                                style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),

                            SizedBox(height: 16,),
                            
                            // Link text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?"
                                ),
                                TextButton(
                                  onPressed: (){
                                    Get.to(SignUpScreen());
                                  },
                                  child: const Text(
                                    "Create an account",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const Text(
                              "Or",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),

                            // Admin link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Are you a super user?"
                                ),
                                TextButton(
                                  onPressed: (){

                                  },
                                  child: const Text(
                                    "Tap here",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Sign in screen footer
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 100,
                            height: 1,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Utopiamall",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            width: 100,
                            height: 1,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}