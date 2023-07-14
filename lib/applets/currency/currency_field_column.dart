import 'package:flutter/material.dart';
import 'currency_field_tile.dart';

class CurrencyFieldColumn extends StatefulWidget {
  const CurrencyFieldColumn({
    super.key,
    required this.exchangeRates,
  });

  final Map<String, double> exchangeRates;

  @override
  State<CurrencyFieldColumn> createState() => _CurrencyFieldColumnState();
}

class _CurrencyFieldColumnState extends State<CurrencyFieldColumn> {
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

  List<Widget> toWidgetList() {
    List<Widget> widgetList = [];

    for (var entry in ratesList) {
      widgetList.add(CurrencyFieldTile(
        label: entry[0],
        currencyRatio: entry[1],
        thisFieldIndex: ratesList.indexOf(entry),
        activeIndex: selectedField,
        setActiveFieldIndex: setSelectedField,
        valueInUSD: valueInUSD,
        setValueInUSD: setValueInUSD,
      ));
    }

    return widgetList;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.exchangeRates.forEach((key, value) {
        ratesList.add([key, value]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: toWidgetList(),
    );
  }
}
