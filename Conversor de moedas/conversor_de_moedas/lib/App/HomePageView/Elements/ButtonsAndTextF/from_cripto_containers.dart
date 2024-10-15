import 'package:conversor_de_moedas/App/HomePageView/Controllers/home_controller.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/dropdown_buttons.dart';
import 'package:flutter/material.dart';

class MoedasCont extends StatefulWidget {
  final HomeController homeController;

  const MoedasCont({super.key, required this.homeController});

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
          SizedBox(
            width: 300,
            height: 40,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: DropDownB(
                    onSelected: (value) {
                      setState(() {
                        widget.homeController.alteraMoedasFrom(value);
                      });
                    },
                    positionDropdown: widget.homeController.indexMoedasFrom,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, bottom: 8),
                    child: TextField(
                      controller: widget.homeController.fromTextMoedas,
                      style: const TextStyle(
                          decorationStyle: TextDecorationStyle.solid,
                          color: Colors.amber),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      cursorColor: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
