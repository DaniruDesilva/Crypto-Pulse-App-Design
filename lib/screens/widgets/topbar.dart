import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({
    super.key,
    required this.myHeight,
    required this.myWidth,
  });

  final double myHeight;
  final double myWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: myHeight * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: myWidth * 0.02, vertical: myHeight * 0.005),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: const Text(
              'Main portfolio',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Text(
            'Top 10 coins',
            style: TextStyle(fontSize: 18),
          ),
          const Text(
            'Exprimental',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
