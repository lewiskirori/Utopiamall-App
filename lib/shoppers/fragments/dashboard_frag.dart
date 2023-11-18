import 'package:flutter/material.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getGreeting()),
      ),
      body: Center(
        child: Text(
          "Welcome to Your U-Dash!",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
} 