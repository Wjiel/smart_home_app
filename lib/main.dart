import 'package:flutter/material.dart';
import 'package:smart_home_app/home_screen/HomeScreen.dart';

void main() {
  runApp(
    const MaterialApp(
      themeAnimationCurve: Curves.easeInOutCirc,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
