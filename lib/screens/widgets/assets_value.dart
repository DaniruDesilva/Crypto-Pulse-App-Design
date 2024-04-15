import 'package:flutter/material.dart';

class CustomAssetsValueBar extends StatelessWidget {
  const CustomAssetsValueBar({
    super.key,
    required this.myWidth,
    required this.myHeight,
  });

  final double myWidth;
  final double myHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$ 7,466.20',
                style: TextStyle(fontSize: 35),
              ),
              Container(
                padding: EdgeInsets.all(myWidth * 0.02),
                height: myHeight * 0.04,
                width: myWidth * 0.1,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.5)),
                child: Image.asset(
                  'assets/icons/5.1.png',
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: myWidth * 0.07),
          child: const Row(
            children: [
              Text(
                '+162% all time',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
