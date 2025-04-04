import 'dart:async';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/home_screen/Widgets/GridViewItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double paddingEl = 20;

  int itemCount = 0;
  bool isStart = false;
  final GlobalKey<SliverAnimatedGridState> _listKey =
      GlobalKey<SliverAnimatedGridState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isStart = true;

        Timer.periodic(Duration(milliseconds: 300), (timer) {
          _listKey.currentState!.insertItem(itemCount);
          itemCount++;

          if (itemCount == 4) timer.cancel();
        });
      });
    });
  }

  List<Map<String, dynamic>> data = [
    {
      'title': 'Living Room',
      "countDevices": 6,
      "imageAsset": 'assets/images/sofa.png',
      "backgroundColorContainer": Color(0xFF7f85f9),
      "trackColor": Color(0xFF6771f9),
      "isBlack": false,
    },
    {
      'title': 'Kitchen',
      "countDevices": 5,
      "imageAsset": 'assets/images/burger.png',
      "backgroundColorContainer": Color(0xFFfef7ec),
      "trackColor": Color(0xFFffe7c7),
      "isBlack": true,
    },
    {
      'title': 'Bath Room',
      "countDevices": 8,
      "imageAsset": 'assets/images/bath.png',
      "backgroundColorContainer": Color(0xFFe3f9ff),
      "trackColor": Color(0xFFa2f4fc),
      "isBlack": true,
    },
    {
      'title': 'Dining Room',
      "countDevices": 7,
      "imageAsset": 'assets/images/spageti.png',
      "backgroundColorContainer": Color(0xFFf3ffe9),
      "trackColor": Color(0xFFd8fdb6),
      "isBlack": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 40),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingEl),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(360),
                    onTap: () {},
                    child: Icon(Icons.menu, size: 30),
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: Image.asset(
                      'assets/images/slavaHa.gif',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: paddingEl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          AutoSizeText(
                            'Hi Slava',
                            minFontSize: 15,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image.asset('assets/images/hello.png', height: 30),
                        ],
                      ),
                      AutoSizeText(
                        'Welcome to uisharks home.',
                        minFontSize: 15,
                        maxLines: 1,
                        style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: 70,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Material(
                      color: Colors.transparent,

                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isStart = !isStart;
                          });
                        },
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Color(0xFFfff0ec),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20),
                            ),
                          ),
                          child: AnimatedPadding(
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              right: isStart ? 30 : 0,
                              left: 10,
                            ),
                            duration: Duration(milliseconds: 300),
                            child: Image.asset(
                              'assets/images/search.png',
                              height: 30,
                            ),
                          ),
                          //child: Icon(Icons.search, size: 30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 40),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingEl),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedFlipCounter(
                      value: isStart ? 6 : 0,
                      suffix: ' devices connected',
                      duration: Duration(milliseconds: 300),
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      'Living Room',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(15),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Color(0xFFe3f6f6),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Color(0xffdfecec), spreadRadius: 2),
                        BoxShadow(color: Colors.white, spreadRadius: 1),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    child: Row(
                      spacing: 10,
                      children: [
                        Text(
                          'Add',
                          style: TextStyle(
                            color: Color(0xFF7ed0d5),
                            fontSize: 15,
                          ),
                        ),
                        Icon(Icons.add_circle, color: Color(0xFF7ed0d5)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: CustomScrollView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              slivers: [
                SliverAnimatedGrid(
                  initialItemCount: itemCount,
                  key: _listKey,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 270,
                  ),
                  itemBuilder: (context, i, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: GridViewItem(data: data[i]),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
