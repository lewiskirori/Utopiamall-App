import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utopiamall/shoppers/auth/signin_screen.dart';
import 'package:utopiamall/shoppers/fragments/dashboard_frag.dart';
import 'package:utopiamall/shoppers/shopperPreferences/shopper_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Application root widget
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Utopiamall',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFB0188E, {
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
        }),
        textTheme: GoogleFonts.jostTextTheme(),
      ),
      home: FutureBuilder(
        future: RememberShopperPrefs.readShopperInfo(),
        builder: (context, dataSnapShot)
        {
          if(dataSnapShot.data == null) {
            return LoginScreen();
          } else {
            return DashboardFrag();
          }
        },
      ),
    );
  }
}
