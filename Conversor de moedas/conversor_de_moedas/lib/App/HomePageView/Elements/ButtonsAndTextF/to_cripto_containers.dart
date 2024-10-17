import 'package:conversor_de_moedas/App/HomePageView/Controllers/home_controller.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/dropdown_buttons.dart';
import 'package:flutter/material.dart';

class MoedasMostra extends StatefulWidget {
  final HomeController homeController;

  const MoedasMostra({super.key, required this.homeController});

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
                      positionDropdown: widget.homeController.indexModeasTo,
                      onSelected: (value) {
                        setState(() {
                          widget.homeController.alteraMoedasTo(value);
                        });
                      }),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 300,
                    margin: const EdgeInsets.only(
                      left: 20,
                      bottom: 8,
                    ),
                    child: TextField(
                      controller: widget.homeController.toTextMoedas,
                      cursorColor: Colors.amber,
                      style: const TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        disabledBorder: InputBorder.none,
                        hoverColor: Colors.white,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
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
