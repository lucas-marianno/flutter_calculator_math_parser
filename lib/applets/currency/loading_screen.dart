// import 'package:flutter/material.dart';
// import 'package:math_expression_parser/applets/currency/currency_main.dart';
// import 'exchange_rates_getter.dart';

// class CurrencyConverterLoading extends StatelessWidget {
//   const CurrencyConverterLoading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ExchangeRates exchangeRates = ExchangeRates();

//     void update() async {
//       await exchangeRates.initializeExchangeRates();

//       // ignore: use_build_context_synchronously
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => CurrencyMain(exchangeRates: exchangeRates),
//         ),
//       );
//     }

//     update();
//     return const Scaffold(body: Center(child: CircularProgressIndicator()));
//   }
// }
