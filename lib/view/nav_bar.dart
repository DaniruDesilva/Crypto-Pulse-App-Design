import 'package:crypto_pulse/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../screens/another_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const AnotherPage(),
    const AnotherPage(),
    const AnotherPage(),
  ];

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: pages.elementAt(_currentIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: ((value) {
              setState(() {
                _currentIndex = value;
              });
            }),
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/1.1.png',
                  height: myHeight * 0.03,
                  color: Colors.grey,
                ),
                label: '',
                activeIcon: Image.asset(
                  'assets/icons/1.2.png',
                  height: myHeight * 0.03,
                  color: Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/2.1.png',
                  height: myHeight * 0.03,
                  color: Colors.grey,
                ),
                label: '',
                activeIcon: Image.asset(
                  'assets/icons/2.2.png',
                  height: myHeight * 0.03,
                  color: Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/3.1.png',
                  height: myHeight * 0.03,
                  color: Colors.grey,
                ),
                label: '',
                activeIcon: Image.asset(
                  'assets/icons/3.2.png',
                  height: myHeight * 0.03,
                  color: Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/4.1.png',
                  height: myHeight * 0.03,
                  color: Colors.grey,
                ),
                label: '',
                activeIcon: Image.asset(
                  'assets/icons/4.2.png',
                  height: myHeight * 0.03,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }
}
