import 'package:flutter/material.dart';
import 'package:math_expression_parser/applets/currency/currency_converter.dart';
import 'package:math_expression_parser/applets/currency/exchange_rates_getter.dart';

import '../../constants.dart';

class CurrencyMain extends StatelessWidget {
  const CurrencyMain({super.key, required this.exchangeRates});

  final ExchangeRates exchangeRates;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const TabBar(
            isScrollable: false,
            indicatorColor: kHighEmphasisButtonColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: kHighEmphasisButtonColor,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.star)),
              Tab(icon: Icon(Icons.view_list)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // TODO: Learn how to save local profile on device
            // develop a way to select, store and retrieve favorites
            CurrencyConverter(exchangeRates: ExchangeRates().mock()),
            CurrencyConverter(exchangeRates: exchangeRates),
          ],
        ),
      ),
    );
  }
}
