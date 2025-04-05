import 'dart:async';

import 'package:flutter/material.dart';
import "package:scroll_to_hide/scroll_to_hide.dart";

class CustomNavigationBar extends StatefulWidget {
  PageController pageController;
  ScrollController scrollController;
  CustomNavigationBar({
    super.key,
    required this.pageController,
    required this.scrollController,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  final double sizeIcon = 28;
  int indexNavigationBar = 1;

  EdgeInsets padding = const EdgeInsets.all(5);
  Color iconNavigationBarColor = Colors.white;

  @override
  void initState() {
    super.initState();
    changeAnim();
  }

  void changeAnim() {
    setState(() {
      padding = const EdgeInsets.all(5);
    });
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        padding = const EdgeInsets.all(10);
      });
    });
  }

  void swich() {
    widget.pageController.animateToPage(
      indexNavigationBar,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget container(Widget child) {
      return SizedBox(
        width: 84,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(spreadRadius: 4, color: Color(0xFF7f85f9)),
                    BoxShadow(spreadRadius: 2, color: Colors.white),
                  ],
                  color: Color(0xFF7f85f9),
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30),
                    left: Radius.circular(30),
                  ),
                ),
                child: AnimatedPadding(
                  padding: padding,
                  duration: const Duration(milliseconds: 200),
                  child: child,
                ),
              ),
            ),
          ],
        ),
      );
    }

    final items = <Widget>[
      indexNavigationBar == 0
          ? container(
            Image.asset(
              'assets/images/flash.png',
              width: sizeIcon,
              color: iconNavigationBarColor,
            ),
          )
          : InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/flash.png',
                width: sizeIcon,
                color: Colors.grey,
              ),
            ),
          ),
      indexNavigationBar == 1
          ? container(
            Image.asset(
              'assets/images/home.png',
              width: sizeIcon,
              color: iconNavigationBarColor,
            ),
          )
          : InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/home.png',
                width: sizeIcon,
                color: Colors.grey,
              ),
            ),
          ),
      indexNavigationBar == 2
          ? container(
            Image.asset(
              'assets/images/people.png',
              width: sizeIcon,
              color: iconNavigationBarColor,
            ),
          )
          : InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Image.asset(
                'assets/images/people.png',
                width: sizeIcon,
                color: Colors.grey,
              ),
            ),
          ),
    ];
    return ScrollToHide(
      scrollController: widget.scrollController,
      duration: const Duration(milliseconds: 300),
      hideDirection: Axis.vertical,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x20000000),
                blurRadius: 15.4,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ),
      ),
    );
  }
}
