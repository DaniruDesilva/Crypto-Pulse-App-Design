// ignore_for_file: sized_box_for_whitespace

import 'package:crypto_pulse/view/nav_bar.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.black,
        height: myHeight,
        width: myWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/images/1.gif'),
            const Column(
              children: [
                Text(
                  'The Future of Currency',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  'Learn more about cryptocurrency, look to',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
                Text(
                  'the future in crypto pulse',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: myWidth * 0.14),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NavBar()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: myWidth * 0.05, vertical: myWidth * 0.013),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create Portfolio  ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        RotationTransition(
                            turns: AlwaysStoppedAnimation(310 / 360),
                            child: Icon(Icons.arrow_forward_rounded))
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
