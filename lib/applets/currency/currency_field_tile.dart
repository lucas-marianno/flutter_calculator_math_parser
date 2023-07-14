import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expression_parser/applets/currency/currency_favorites.dart';

class CurrencyFieldTile extends StatefulWidget {
  const CurrencyFieldTile({
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
  State<CurrencyFieldTile> createState() => _CurrencyFieldTileState();
}

class _CurrencyFieldTileState extends State<CurrencyFieldTile> {
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
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                Favorites().toggleFavorite(widget.label);
              });
            },
            icon: Icon(Favorites().contains(widget.label) ? Icons.star : Icons.star_border),
          ),
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
