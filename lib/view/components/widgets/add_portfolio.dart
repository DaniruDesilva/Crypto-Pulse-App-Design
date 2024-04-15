import 'package:flutter/material.dart';

class AddPortfolioBar extends StatelessWidget {
  const AddPortfolioBar({
    super.key,
    required this.myHeight,
    required this.myWidth,
  });

  final double myHeight;
  final double myWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      height: myHeight * 0.1,
      width: myWidth,
      // color: Colors.amber,
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            height: myHeight * 0.01,
          ),
          Row(
            children: [
              SizedBox(
                width: myWidth * 0.05,
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: myHeight * 0.015),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffFBC700)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: myHeight * 0.02,
                      ),
                      const Text(
                        'Add to portfolio',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: myWidth * 0.05,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: myHeight * 0.012),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey.withOpacity(0.2)),
                  child: Image.asset(
                    'assets/icons/3.1.png',
                    height: myHeight * 0.03,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: myWidth * 0.05,
              ),
            ],
          )
        ],
      ),
    );
  }
}
