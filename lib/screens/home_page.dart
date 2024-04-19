// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:crypto_pulse/models/coin_model.dart';
import 'package:crypto_pulse/view/components/item2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import 'widgets/assets.dart';
import 'widgets/assets_value.dart';
import 'widgets/topbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getCoinMarket();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: myHeight,
        width: myWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 249, 214, 73), Color(0xffFBC700)]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTopBar(myHeight: myHeight, myWidth: myWidth),
            CustomAssetsValueBar(myWidth: myWidth, myHeight: myHeight),
            SizedBox(
              height: myHeight * 0.02,
            ),
            Container(
              height: myHeight * 0.67,
              width: myWidth,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        color: Colors.grey.shade300,
                        spreadRadius: 3,
                        offset: const Offset(0, 3))
                  ],
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  Assets(
                      myWidth: myWidth,
                      myHeight: myHeight,
                      isRefreshing: isRefreshing,
                      coinMarket: coinMarket),
                  SizedBox(
                    height: myHeight * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: myWidth * 0.05),
                    child: const Row(
                      children: [
                        Text(
                          'Recommend to Buy',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: myHeight * 0.01,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: myWidth * 0.03),
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
                                  scrollDirection: Axis.horizontal,
                                  itemCount: coinMarket!.length,
                                  itemBuilder: (context, index) {
                                    return Item2(
                                      item: coinMarket![index],
                                    );
                                  },
                                ),
                    ),
                  ),
                  SizedBox(
                    height: myHeight * 0.01,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isRefreshing = true;

  List? coinMarket = [];
  var coinMarketList;
  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';
    setState(() {
      isRefreshing = true;
    });
    var response = await http.get(Uri.parse(url), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
    });
    setState(() {
      isRefreshing = false;
    });
    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      Logger().f(response.statusCode);
    }
    return null;
  }
}
