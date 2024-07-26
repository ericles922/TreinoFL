import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/dropdown_buttons.dart';
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
            width: 300,
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
                  flex: 2,
                  child: Container(
                    height: 300,
                    margin: const EdgeInsets.only(
                      left: 20,
                      bottom: 8,
                    ),
                    child: const TextField(
                      cursorColor: Colors.amber,
                      style: TextStyle(color: Colors.amber),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        hoverColor: Colors.amber,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      canRequestFocus: false,
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
