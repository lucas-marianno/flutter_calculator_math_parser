import 'package:flutter/material.dart';
import 'package:math_expression_parser/applets/currency/currency_field_tile.dart';
import 'exchange_rates_getter.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({
    super.key,
    required this.exchangeRates,
    required this.refreshCallBackFunction,
  });

  final ExchangeRates exchangeRates;
  final Future<void> Function() refreshCallBackFunction;

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  late Map<String, double> exchangeRatesMap;
  int? selectedField;
  num valueInUSD = 1;
  List ratesList = [];

  void setSelectedField(int? fieldIndex) {
    setState(() {
      selectedField = fieldIndex;
    });
  }

  void setValueInUSD(num newValueInUSD) {
    setState(() {
      valueInUSD = newValueInUSD;
    });
  }

  @override
  void initState() {
    exchangeRatesMap = widget.exchangeRates.rates;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.exchangeRates.rates.isEmpty) {
      return const Center(
        child: Text(
          'Your favorites will appear here when you select them',
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () => widget.refreshCallBackFunction(),
      child: ListView.builder(
        itemCount: exchangeRatesMap.entries.length,
        itemBuilder: (context, index) {
          final String label = exchangeRatesMap.entries.toList()[index].key;
          final double currencyRatio = exchangeRatesMap[label]!;

          return CurrencyFieldTile(
            label: label,
            currencyRatio: currencyRatio,
            thisFieldIndex: index,
            activeIndex: selectedField,
            setActiveFieldIndex: setSelectedField,
            valueInUSD: valueInUSD,
            setValueInUSD: setValueInUSD,
          );
        },
      ),
    );
  }
}
