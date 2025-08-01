import 'package:conversor_de_moedas/App/HomePageView/Controllers/home_controller.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/dropdown_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoedasMostra extends StatefulWidget {
  final HomeController homeController;

  const MoedasMostra({super.key, required this.homeController});

  @override
  State<MoedasMostra> createState() => MoedasMostraState();
}

class MoedasMostraState extends State<MoedasMostra> {
  String? selectedToCurrency;
  final List<String> _currencyCodes = ["BRL", "USD", "EUR", "GBP", "BTC"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(children: <Widget>[
        SizedBox(
          width: 160.w,
          height: 45.h,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: DropDownB(
                  positionDropdown: widget.homeController.indexModeasTo,
                  onSelected: (String? newValue) {
                    setState(() {
                      selectedToCurrency = newValue;
                      widget.homeController.alteraMoedasTo(_currencyCodes
                          .indexOf(newValue ?? "BRL")); // Passa o índice (int)
                      widget.homeController.convert(); // Passa a sigla (String)
                    });
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 45.h,
                  margin: const EdgeInsets.only(
                    left: 20,
                    bottom: 9,
                  ),
                  child: TextField(
                    controller: widget.homeController.toTextMoedas,
                    cursorColor: Colors.amber,
                    style: const TextStyle(color: Colors.amber),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
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
      ]),
    );
  }
}
