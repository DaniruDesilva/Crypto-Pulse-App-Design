import 'package:flutter/material.dart';

import '../../view/components/item.dart';

class Assets extends StatelessWidget {
  const Assets({
    super.key,
    required this.myWidth,
    required this.myHeight,
    required this.isRefreshing,
    required this.coinMarket,
  });

  final double myWidth;
  final double myHeight;
  final bool isRefreshing;
  final List? coinMarket;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: myWidth * 0.08),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Assets',
                style: TextStyle(fontSize: 16),
              ),
              Icon(Icons.add)
            ],
          ),
        ),
        SizedBox(
          height: myHeight * 0.02,
        ),
        Builder(builder: (context) {
          return SizedBox(
            height: myHeight * 0.37,
            child: isRefreshing == true
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xffFBC700),
                    ),
                  )
                : coinMarket == null || coinMarket!.isEmpty
                    ? Padding(
                        padding: EdgeInsets.all(myHeight * 0.06),
                        child: const Center(
                          child: Text(
                            'Attention this Api is-free, so you cannot send multiple requests per second, please wait and try again later. ',
                            style: TextStyle(
                                fontSize: 18, color: Colors.red),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: 4,
                        physics:
                            const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Item(
                            item: coinMarket![index],
                          );
                        },
                      ),
          );
        }),
      ],
    );
  }
}
