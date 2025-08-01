import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Nome de classe inicial Maiuscula
class DropDownB extends StatefulWidget {
  final void Function(String?) onSelected; // Retorna a sigla (String?)
  final int positionDropdown;

  const DropDownB({
    required this.positionDropdown,
    required this.onSelected,
    super.key,
  });

  @override
  State<DropDownB> createState() => _DropDownBState();
}

class _DropDownBState extends State<DropDownB> {
  String? _selectedValue;
  final List<String> _currencyNames = [
    "Real",
    "Dolar",
    "Euro",
    "Libra",
    "Bitcoin"
  ];
  final List<String> _currencyCodes = ["BRL", "USD", "EUR", "GBP", "BTC"];

  @override
  void initState() {
    super.initState();
    _selectedValue = _currencyCodes[widget.positionDropdown];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtilInit;
    return SizedBox(
      child: DropdownButton<String>(
        alignment: Alignment.center,
        style: const TextStyle(),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.amber),
        underline: Container(height: 1, color: Colors.amber),
        dropdownColor: const Color.fromRGBO(59, 63, 66, 1),
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        value: _selectedValue,
        items: _currencyNames.asMap().entries.map((entry) {
          int index = entry.key;
          String name = entry.value;
          String code = _currencyCodes[index];
          return DropdownMenuItem<String>(
            // Tipo do DropdownMenuItem é String
            value: code, // O valor é a sigla
            child: Text(name,
                style: const TextStyle(color: Colors.amber)), // Exibe o nome
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedValue = newValue;
          });
          widget.onSelected(newValue); // Retorna a sigla para o Widget pai
        },
      ),
    );
  }
}
