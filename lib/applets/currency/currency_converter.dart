import 'package:flutter/material.dart';
import 'currency_field_column.dart';
import 'exchange_rates_getter.dart';

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key, required this.exchangeRates});

  final ExchangeRates exchangeRates;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
              child: CurrencyFieldColumn(exchangeRates: exchangeRates.rates),
            ))),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: Center(
                child: Text(
                  exchangeRates.hasUpdatedRates
                      ? 'Exchange rates last updated in ${exchangeRates.lastUpdated}'
                      : '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
