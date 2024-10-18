import 'package:flutter/material.dart';

//Nome de classe inciial Maiuscula
class DropDownB extends StatefulWidget {
  final void Function(int?) onSelected;
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
              value: 0,
              child: Text("Real", style: TextStyle(color: Colors.amber))),
          DropdownMenuItem(
              value: 1,
              child: Text("Dolar", style: TextStyle(color: Colors.amber))),
          DropdownMenuItem(
              value: 2,
              child: Text("Euro", style: TextStyle(color: Colors.amber))),
          DropdownMenuItem(
              value: 3,
              child: Text("Libra", style: TextStyle(color: Colors.amber))),
          DropdownMenuItem(
              value: 4,
              child: Text("Bitcoin", style: TextStyle(color: Colors.amber)))
        ],
        onChanged: widget.onSelected,
      ),
    );
  }
}
