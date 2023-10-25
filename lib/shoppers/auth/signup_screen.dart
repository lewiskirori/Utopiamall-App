import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utopiamall/shoppers/auth/signin_screen.dart';

class SignUpScreen extends StatefulWidget {

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isObsecure = true.obs;

  @override
  Widget build(BuildContext context) {
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

                  // Sign up screen header
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 285,
                    child: Image.asset(
                      "images/andrea--register.jpg",
                    ),
                  ),

                  // Sign up body
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
                            
                            // Sign up form
                            Form(
                              key: formKey,
                              child: Column(
                                children: [

                                  // Heading
                                  Container(
                                    child: const Text(
                                      "Create your account",
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 16,),

                                  // User name
                                  TextFormField(
                                    controller: usernameController,
                                    validator: (val) => val == "" ? "Enter a valid account username." : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.person_sharp,
                                        color: Colors.black,
                                      ),
                                      hintText: "Account Name (Username)",
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
                                      validator: (val) => val == "" ? "Your password must contain at least 8 characters." : null,
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.lock_sharp,
                                          color: Colors.black,
                                        ),
                                        suffixIcon: Obx(
                                          ()=> GestureDetector(
                                            onTap: ()
                                            {
                                              isObsecure.value = !isObsecure.value;
                                            },
                                            child: Icon(
                                              isObsecure.value ? Icons.visibility_off :  Icons.visibility,
                                              color: Colors.black,
                                            ),
                                          )
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
                  
                                  // Sign up button
                                  Material(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(30),
                                    child: InkWell(
                                      onTap: (){
                  
                                      },
                                      borderRadius: BorderRadius.circular(30),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 28,
                                        ),
                                        child: Text(
                                          "Get Started",
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

                            const SizedBox(height: 16,),
                            
                            // Link text
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have a UtopiaMall account?"
                                ),
                                TextButton(
                                  onPressed: (){
                                    Get.to(LoginScreen());
                                  },
                                  child: const Text(
                                    "Log in",
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}