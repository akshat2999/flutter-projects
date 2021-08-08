import 'package:flutter/material.dart';
import 'package:gymnash_owner/Dashboard/Widgets/ProfileWidget.dart';
import 'package:gymnash_owner/Utilities/SizeConfig.dart';
import 'package:gymnash_owner/Utilities/Theme.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../Widgets/GymsWidget.dart';

class DashboardScreen extends StatefulWidget {
  static final routeName = "/dash";

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List widgets = [GymWidget(), ProfileWidget()];
  @override
  Widget build(BuildContext context) {
    int _bottomNavIndex = 0;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        titleSpacing: 0,
        centerTitle: true,
        title: Text("Gymnash App"),
      ),
      body: widgets[_bottomNavIndex],
      // floatingActionButton: FloatingActionButton.ex(
      //   child: Row(
      //     children: [
      //       Container(
      //         color: ThemeColors.primary,
      //         height: 20,
      //         width: 20,
      //       )
      //     ],
      //   ),
      //   backgroundColor: ThemeColors.accent,
      //   onPressed: () {},
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: ThemeColors.accent,
        backgroundColor: ThemeColors.secondary,
        icons: [Icons.donut_small, Icons.account_circle_outlined],
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) => setState(() {
          _bottomNavIndex = index;
          print(_bottomNavIndex);
        }),
        //other params
      ),
    );
  }
}
