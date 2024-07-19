import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/Dropdownbuttons.dart';
import 'package:flutter/material.dart';

class MoedasMostra extends StatefulWidget {
  const MoedasMostra({super.key});

  @override
  State<MoedasMostra> createState() => MoedasMostraState();
}

class MoedasMostraState extends State<MoedasMostra> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          SizedBox(
            width: 180,
            height: 40,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: DropDownB(
                    true,
                    positionDropdown: 2,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 8),
                    child: const TextField(
                        style: TextStyle(color: Colors.amber),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(disabledBorder: InputBorder.none,
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                          ),
                        ),
                        canRequestFocus: false),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
