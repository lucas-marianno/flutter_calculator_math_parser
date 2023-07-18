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
  Widget tab0 = CurrencyConverter(exchangeRates: exchangeRates.favs());
  Widget tab1 = CurrencyConverter(exchangeRates: exchangeRates);

  _handleTabSelection() {
    /// TODO: Investigate this further and fix it.
    /// This is a horrible way of achieving the goal of reloading the page.
    /// for some reason, [setState] isn't rebuilding everything, probably due to
    /// [CurrencyFieldTile] be a StatefulWidget.
    if (tabController.index == 0) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration.zero,
          pageBuilder: (_, __, ___) => const CurrencyMain(),
        ),
      );
    }
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
                  tab0,
                  tab1,
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
