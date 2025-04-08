import 'package:conversor_de_moedas/App/HomePageView/Controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/dropdown_buttons.dart';
import 'package:flutter/material.dart';

class MoedasCont extends StatefulWidget {
  final HomeController homeController;

  const MoedasCont({super.key, required this.homeController});

  @override
  State<MoedasCont> createState() => MoedasContState();
}

class MoedasContState extends State<MoedasCont> {
  final List<String> _currencyCodes = ["BRL", "USD", "EUR", "GBP", "BTC"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          SizedBox(
            width: 160.w,
            height: 45.h,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: DropDownB(
                    onSelected: (String? newValue) {
                      setState(() {
                        widget.homeController.alteraMoedasFrom(
                            _currencyCodes.indexOf(
                                newValue ?? "BRL")); 
                      });
                    },
                    positionDropdown: widget.homeController.indexMoedasFrom,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 28.h,
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: TextField(
                      controller: widget.homeController.fromTextMoedas,
                      style: const TextStyle(
                          decorationStyle: TextDecorationStyle.solid,
                          color: Colors.amber),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        fillColor: Colors.black,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 194, 194, 192),
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 194, 194, 192),
                          ),
                        ),
                      ),
                      cursorColor: const Color.fromARGB(255, 194, 194, 192),
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
