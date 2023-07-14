import 'package:flutter/material.dart';
import 'package:math_expression_parser/applets/currency/currency_converter.dart';
import 'package:math_expression_parser/applets/currency/exchange_rates_getter.dart';

import '../../constants.dart';

class CurrencyMain extends StatefulWidget {
  const CurrencyMain({super.key, required this.exchangeRates});

  final ExchangeRates exchangeRates;

  @override
  State<CurrencyMain> createState() => _CurrencyMainState();
}

class _CurrencyMainState extends State<CurrencyMain> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late Widget child1;
  late Widget child2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    child1 = CurrencyConverter(exchangeRates: widget.exchangeRates.favs());
    child2 = CurrencyConverter(exchangeRates: widget.exchangeRates);
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() => _handleTabSelection());
  }

  _handleTabSelection() {
    setState(() {
      child1 = CurrencyConverter(exchangeRates: widget.exchangeRates.favs());
    });
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
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            child1,
            child2,
          ],
        ),
      ),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({super.key});

  @override
  State<MyTabbedPage> createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    print('new state');

    if (_tabController.indexIsChanging) {
      setState(() {
        // This function will be called every time the tab changes
        // You can update your data here based on the selected tab
        // For example, you can update a list of items to be displayed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabbed Page'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tab 1'),
            Tab(text: 'Tab 2'),
            Tab(text: 'Tab 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Replace these with your actual widget builders
          Center(child: Text('Contents of Tab 1')),
          Center(child: Text('Contents of Tab 2')),
          Center(child: Text('Contents of Tab 3')),
        ],
      ),
    );
  }
}
