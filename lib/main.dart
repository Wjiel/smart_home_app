import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_home_app/home_screen/HomeScreen.dart';

void main() {
  runApp(
    const MaterialApp(
      themeAnimationCurve: Curves.easeInOutCirc,
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: SplashScreen(),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List _allImages = [];

  Future _getAssetImages() async {
    final assetManifest = await AssetManifest.loadFromAssetBundle(rootBundle);
    _allImages =
        assetManifest
            .listAssets()
            .where((string) => string.startsWith("assets/images/"))
            .toList();
  }

  Future _checkLaunch() async {
    await _getAssetImages();

    for (var asset in _allImages) {
      await precacheImage(AssetImage(asset), context);
    }

    Timer(Duration(seconds: 2), () => _navigateToMain());
  }

  @override
  void initState() {
    super.initState();
    _checkLaunch();
  }

  void _navigateToMain() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/slavaHa.gif',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
