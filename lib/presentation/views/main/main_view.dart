import 'package:bottom_nav_layout/bottom_nav_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:storayge/presentation/views/find/find_view.dart';
import 'package:storayge/presentation/views/home/home_view.dart';
import 'package:storayge/presentation/views/list/list_screen.dart';
import 'package:storayge/presentation/views/me/me_screen.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
    ),
    Text(
      'Likes',
    ),
    Text(
      'Search',
    ),
    Text(
      'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BottomNavLayout(
      pages: [
        (_) => HomeView(),
        (_) => ListScreen(),
        (_) => FindView(),
        (_) => MeScreen(),
      ],
      bottomNavigationBar: (currentIndex, onTap) => GNav(
        tabs: [
          const GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          const GButton(
            icon: Icons.label_important,
            text: 'Likes',
          ),
          const GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          const GButton(
            icon: Icons.portable_wifi_off,
            text: 'Profile',
          ),
        ],
        selectedIndex: currentIndex,
        onTabChange: onTap,
      ),
    ));
  }
}
