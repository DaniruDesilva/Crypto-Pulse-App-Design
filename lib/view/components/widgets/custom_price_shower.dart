import 'package:flutter/material.dart';

import '../../select_coin.dart';

class CustomPriceShower extends StatelessWidget {
  const CustomPriceShower({
    super.key,
    required this.myHeight,
    required this.widget,
    required this.text,
    required this.value,
  });

  final double myHeight;
  final SelectCoin widget;
  final String text;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal, color: Colors.grey),
        ),
        SizedBox(
          height: myHeight * 0.01,
        ),
        Text(
          '\$${'${value}M'}',
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
        ),
      ],
    );
  }
}
