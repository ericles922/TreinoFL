import 'dart:ffi';

import 'package:conversor_de_moedas/App/Models/models.dart';
import 'package:conversor_de_moedas/repositories/repositorie_moedas_monetarias.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  RepositorieMoedasMonetarias repository = RepositorieMoedasMonetarias();

  @override
  Widget build(BuildContext context) {
    List<MoedasMonetarias> moedas = repository.index();
    //List _controllerValue = Index['Real','Dolar','Libra','Euro'];



    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                child: Image.asset(
                  'svg.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              //ListView() Estudar Depois **Não esquecer!!!!
              SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: DropdownButton(
                        items: [
                          DropdownMenuItem(
                              value: 1,
                              child: Text("Real",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))),
                          DropdownMenuItem(value: 2, child: Text("Dolar")),
                          DropdownMenuItem(value: 3, child: Text("Euro")),
                          DropdownMenuItem(value: 4, child: Text("Libra")),
                          DropdownMenuItem(value: 5, child: Text("Bitcoin"))
                        ],
                        onChanged: (value) {
                          setState(() => value.toString()
                      );}, 
                        padding: const EdgeInsets.only(top: 16),
                      ),
                    ),
                    const Expanded(flex: 2, child: TextField())
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("CONVERTER"),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(59, 63, 66, 1),
    );
  }
}
