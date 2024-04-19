// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/chart_model.dart';
import 'components/widgets/add_portfolio.dart';
import 'components/widgets/custom_chart.dart';
import 'components/widgets/custom_price_shower.dart';
import 'components/widgets/news_bar.dart';

// ignore: must_be_immutable
class SelectCoin extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var selectItem;

  SelectCoin({super.key, this.selectItem});

  @override
  State<SelectCoin> createState() => _SelectCoinState();
}

class _SelectCoinState extends State<SelectCoin> {
  late TrackballBehavior trackballBehavior;

  @override
  void initState() {
    getChart();
    trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: myHeight,
        width: myWidth,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: myHeight * 0.08,
                          child: Image.network(widget.selectItem.image)),
                      SizedBox(
                        width: myWidth * 0.03,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.selectItem.id,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.selectItem.symbol,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${widget.selectItem.currentPrice.toString()}',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: myHeight * 0.01,
                      ),
                      Text(
                        '${widget.selectItem.marketCapChangePercentage24H.toString()}%',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: widget.selectItem
                                        .marketCapChangePercentage24H >=
                                    0
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.05, vertical: myHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomPriceShower(
                        myHeight: myHeight,
                        widget: widget,
                        text: 'Low',
                        value: widget.selectItem.low24H,
                      ),
                      CustomPriceShower(
                        myHeight: myHeight,
                        widget: widget,
                        text: 'High',
                        value: widget.selectItem.high24H,
                      ),
                      CustomPriceShower(
                        myHeight: myHeight,
                        widget: widget,
                        text: 'Vol',
                        value: widget.selectItem.totalVolume,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.02,
                ),
                Column(
                  children: [
                    CustomChart(
                        myHeight: myHeight,
                        myWidth: myWidth,
                        isRefresh: isRefresh,
                        itemChart: itemChart,
                        trackballBehavior: trackballBehavior),
                    SizedBox(
                      height: myHeight * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      height: myHeight * 0.035,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: text.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: myWidth * 0.02),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    textBool = [
                                      false,
                                      false,
                                      false,
                                      false,
                                      false,
                                      false
                                    ];
                                    textBool[index] = true;
                                  });
                                  setDays(text[index]);
                                  getChart();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: myWidth * 0.03,
                                      vertical: myHeight * 0.005),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: textBool[index] == true
                                        ? const Color(0xffFBC700)
                                            .withOpacity(0.3)
                                        : Colors.transparent,
                                  ),
                                  child: Text(
                                    text[index],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: myHeight * 0.04,
                ),
                NewsBar(myWidth: myWidth, myHeight: myHeight)
              ],
            )),
            AddPortfolioBar(myHeight: myHeight, myWidth: myWidth)
          ],
        ),
      ),
    ));
  }

  List<String> text = ['D', 'W', 'M', '3M', '6M', 'Y'];
  List<bool> textBool = [false, false, true, false, false, false];

  int days = 30;

  setDays(String txt) {
    if (txt == 'D') {
      setState(() {
        days = 1;
      });
    } else if (txt == 'W') {
      setState(() {
        days = 7;
      });
    } else if (txt == 'M') {
      setState(() {
        days = 30;
      });
    } else if (txt == '3M') {
      setState(() {
        days = 90;
      });
    } else if (txt == '6M') {
      setState(() {
        days = 180;
      });
    } else if (txt == 'Y') {
      setState(() {
        days = 365;
      });
    }
  }

  List<ChartModel>? itemChart;

  bool isRefresh = true;

  Future<void> getChart() async {
    String url =
        '${'https://api.coingecko.com/api/v3/coins/' + widget.selectItem.id}/ohlc?vs_currency=usd&days=$days';

    setState(() {
      isRefresh = true;
    });

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    setState(() {
      isRefresh = false;
    });

    if (response.statusCode == 200) {
      Iterable x = json.decode(response.body);
      List<ChartModel> modelList =
          x.map((e) => ChartModel.fromJson(e)).toList();
      setState(() {
        itemChart = modelList;
      });
    } else {
      Logger().e(response.statusCode);
    }
  }
}
