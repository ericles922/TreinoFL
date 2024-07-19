import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/Dropdownbuttons.dart';
import 'package:flutter/material.dart';

class MoedasCont extends StatefulWidget {
  const MoedasCont({super.key});

  @override
  State<MoedasCont> createState() => MoedasContState();
}

class MoedasContState extends State<MoedasCont> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Container(
            width: 180,
            height: 40,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: DropDownB(
                    true,
                    positionDropdown: 1,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, bottom: 8),
                    child: const TextField(
                      style: TextStyle(color: Colors.amber,),textAlign: TextAlign.center,decoration: InputDecoration(disabledBorder: InputBorder.none),
                    ),
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
