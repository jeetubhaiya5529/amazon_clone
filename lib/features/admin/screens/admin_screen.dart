import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/admin/screens/analytics_screen.dart';
import 'package:amazon_clone/features/admin/screens/orders_screen.dart';
import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final AccountServices accountServices = AccountServices();
  int _page = 0;
  double bottoBarWidth = 42;
  double bottomBarBorderWidth = 5;

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const PostScreen(),
    const AnalyticsScreen(),
    const OrdersScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/amazon_in.png',
                    width: 120,
                    height: 45,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                    onPressed: () => accountServices.logOut(context),
                    icon: const Icon(Icons.logout))
                // const Text(
                //   'Admin',
                //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                // ),
              ],
            ),
          )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 28,
          onTap: updatePage,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  width: bottoBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _page == 0
                                  ? GlobalVariables.selectedNavBarColor
                                  : GlobalVariables.backgroundColor,
                              width: bottomBarBorderWidth))),
                  child: const Icon(CupertinoIcons.home),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: bottoBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _page == 1
                                  ? GlobalVariables.selectedNavBarColor
                                  : GlobalVariables.backgroundColor,
                              width: bottomBarBorderWidth))),
                  child: const Icon(CupertinoIcons.chart_bar),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: bottoBarWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: _page == 2
                                  ? GlobalVariables.selectedNavBarColor
                                  : GlobalVariables.backgroundColor,
                              width: bottomBarBorderWidth))),
                  child: const Icon(Icons.all_inbox_outlined),
                ),
                label: ''),
          ]),
      body: pages[_page],
    );
  }
}
