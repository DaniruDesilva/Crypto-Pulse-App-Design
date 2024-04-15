import 'package:flutter/material.dart';

class NewsBar extends StatelessWidget {
  const NewsBar({
    super.key,
    required this.myWidth,
    required this.myHeight,
  });

  final double myWidth;
  final double myHeight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: myWidth * 0.06),
          child: const Text(
            'News',
            style: TextStyle(fontSize: 25),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: myWidth * 0.06,
              vertical: myHeight * 0.01),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Text(
                  'According to CryptoPotato, Bitcoin\'s price experienced a significant drop of \$10,000, potentially due to the prospect of US rate hikes and geopolitical tensions.',
                  textAlign: TextAlign.justify,
                  style:
                      TextStyle(color: Colors.grey, fontSize: 17),
                ),
              ),
              SizedBox(
                width: myWidth * 0.25,
                child: CircleAvatar(
                  radius: myHeight * 0.04,
                  backgroundImage:
                      const AssetImage('assets/images/6456.PNG'),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
