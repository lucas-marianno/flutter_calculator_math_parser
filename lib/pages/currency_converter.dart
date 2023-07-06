import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/currency_exchange_rates_getter.dart';

class CurrencyConverterLoading extends StatelessWidget {
  const CurrencyConverterLoading({super.key});

  @override
  Widget build(BuildContext context) {
    ExchangeRates exchangeRates = ExchangeRates();

    void update() async {
      await exchangeRates.updateExchangeRates();
      // await Future.delayed(const Duration(seconds: 2));

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CurrencyConverter(
            exchangeRates: exchangeRates,
          ),
        ),
      );
    }

    update();
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key, required this.exchangeRates});

  final ExchangeRates exchangeRates;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Convert Currency'),
          centerTitle: true,
        ),
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
                      : 'mock exchange rates',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      widgetList.add(CurrencyField(
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
    setState(() {
      widget.exchangeRates.forEach((key, value) {
        ratesList.add([key, value]);
      });
    });

    super.initState();
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

class CurrencyField extends StatefulWidget {
  const CurrencyField({
    super.key,
    required this.label,
    required this.currencyRatio,
    required this.thisFieldIndex,
    required this.activeIndex,
    required this.setActiveFieldIndex,
    required this.valueInUSD,
    required this.setValueInUSD,
  });

  final String label;
  final num currencyRatio;
  final int thisFieldIndex;
  final int? activeIndex;
  final void Function(int? index) setActiveFieldIndex;
  final num valueInUSD;
  final void Function(num newValueInUSD) setValueInUSD;

  @override
  State<CurrencyField> createState() => _CurrencyFieldState();
}

class _CurrencyFieldState extends State<CurrencyField> {
  TextEditingController controller = TextEditingController();
  TextSelection selection = const TextSelection.collapsed(offset: 0);
  String fieldValue = '';

  @override
  Widget build(BuildContext context) {
    bool isActive = widget.thisFieldIndex == widget.activeIndex;
    bool isInactive = !isActive;
    String hint = limitToTwoDecimal(widget.valueInUSD * widget.currencyRatio).toString();

    if (isInactive) {
      controller.text = '';
      controller.selection = const TextSelection.collapsed(offset: 0);
    }
    if (isActive) {
      controller.text = fieldValue;
      controller.selection = selection;
    }

    return TextField(
      style: const TextStyle(fontSize: 30),
      showCursor: isActive,
      controller: controller,
      decoration: InputDecoration(
          prefixText: '\$ ',
          label: Text(widget.label),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: hint,
          labelStyle: const TextStyle(fontSize: 25)),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        fieldValue = controller.text;
        selection = controller.selection;
        try {
          widget.setValueInUSD(num.parse(fieldValue) / widget.currencyRatio);
        } catch (e) {
          null;
        }
      },
      onTap: () {
        if (isInactive) {
          fieldValue = hint;
          selection = TextSelection(baseOffset: 0, extentOffset: hint.length);
          widget.setActiveFieldIndex(widget.thisFieldIndex);
        } else {
          selection = controller.selection;
        }
      },
      onTapOutside: (_) {
        widget.setActiveFieldIndex(null);
        FocusScope.of(context).requestFocus(FocusNode());
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp(r'\d|\.|-'),
          replacementString: '',
        ),
      ],
    );
  }
}

num limitToTwoDecimal(num n) {
  String s = n.toString().replaceAll(RegExp(r'\.0+$'), '');

  if (s.contains('.') && s.indexOf('.') + 3 < s.length) {
    s = s.substring(0, s.indexOf('.') + 3);
  }

  return num.parse(s);
}
