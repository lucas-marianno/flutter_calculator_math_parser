import 'package:flutter/material.dart';
import 'package:math_expression_parser/applets/currency/currency_converter.dart';
import 'package:math_expression_parser/applets/currency/currency_favorites.dart';
import 'package:math_expression_parser/applets/currency/exchange_rates_getter.dart';
import '../../constants.dart';

class CurrencyMain extends StatefulWidget {
  const CurrencyMain({super.key});

  @override
  State<CurrencyMain> createState() => _CurrencyMainState();
}

class _CurrencyMainState extends State<CurrencyMain> with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);
  Widget child1 = CurrencyConverter(exchangeRates: exchangeRates.favs());
  Widget child2 = CurrencyConverter(exchangeRates: exchangeRates);

  _handleTabSelection() async {
    Future.delayed(const Duration(milliseconds: 250), () {
      setState(() {
        child1 = CurrencyConverter(exchangeRates: exchangeRates.favs());
      });
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    tabController.addListener(() => _handleTabSelection());
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            controller: tabController,
            onTap: (value) {},
            isScrollable: false,
            indicatorColor: kHighEmphasisButtonColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: kHighEmphasisButtonColor,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(icon: Icon(Icons.star)),
              Tab(icon: Icon(Icons.view_list)),
            ],
          ),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text('Clear favorites'),
                  onTap: () => Favorites().clearAll(),
                ),
                // PopupMenuItem(
                //   child: const Text('Print shit'),
                //   onTap: () {
                //     // print(parseStringToMap(exchangeRates.rates.toString()));
                //   },
                // ),
              ],
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  child1,
                  child2,
                ],
              ),
            ),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Exchange rates last updated in ${exchangeRates.lastUpdated}',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
