import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screens.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomNavigationBarWidth = 42;  
  double bottomBarBorderWidth = 5; 

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(child: Text('Cart Page'),),
  ]; 

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updatePage,
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,
        items: [
          BottomNavigationBarItem(icon: Container(
            width: bottomNavigationBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: _page == 0 ? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor, width: bottomBarBorderWidth),)
            ),
            child: const Icon(CupertinoIcons.home),
          ), label: '',),
          BottomNavigationBarItem(icon: Container(
            width: bottomNavigationBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: _page == 1 ? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor, width: bottomBarBorderWidth),)
            ),
            child: const Icon(CupertinoIcons.person),
          ), label: '',),
          BottomNavigationBarItem(icon: Container(
            width: bottomNavigationBarWidth,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: _page == 2 ? GlobalVariables.selectedNavBarColor : GlobalVariables.backgroundColor, width: bottomBarBorderWidth),)
            ),
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -12, end: 0),
              badgeContent: const Text('2'),
              badgeStyle: const badges.BadgeStyle(elevation: 0),
              child: const Icon(CupertinoIcons.cart)),
          ), label: '',)
        ]),
    );
  }
}