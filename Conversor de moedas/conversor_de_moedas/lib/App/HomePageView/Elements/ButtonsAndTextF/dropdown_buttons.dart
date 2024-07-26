import 'package:flutter/material.dart';

//Nome de classe inciial Maiuscula
class DropDownB extends StatefulWidget {
  int positionDropdown;

  DropDownB(value, {required this.positionDropdown, super.key});

  @override
  State<DropDownB> createState() => _DropDownBState();
}

class _DropDownBState extends State<DropDownB> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButton(
        alignment: Alignment.center,
        style: const TextStyle(
          fontSize: 18,
        ),
        icon: const Icon(Icons.arrow_drop_down, color: Colors.amber),
        underline: Container(height: 1, color: Colors.amber),
        dropdownColor: const Color.fromRGBO(59, 63, 66, 1),
        borderRadius: const BorderRadius.all(Radius.circular(0)),
        value: widget.positionDropdown,
        items: const [
          DropdownMenuItem(
              value: 1,
              child: Text("Real", style: TextStyle(color: Colors.amber))),
          DropdownMenuItem(
              value: 2,
              child: Text("Dolar", style: TextStyle(color: Colors.amber))),
          DropdownMenuItem(
              value: 3,
              child: Text("Euro", style: TextStyle(color: Colors.amber))),
          DropdownMenuItem(
              value: 4,
              child: Text("Libra", style: TextStyle(color: Colors.amber))),
          DropdownMenuItem(
              value: 5,
              child: Text("Bitcoin", style: TextStyle(color: Colors.amber)))
        ],
        onChanged: (value) {
          setState(() => widget.positionDropdown = value ?? 1);
        },
      ),
    );
  }
}
