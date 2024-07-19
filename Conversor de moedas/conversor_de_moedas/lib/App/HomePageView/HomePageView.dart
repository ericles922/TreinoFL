import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/FromCriptoContainers.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/ToCriptoContainers.dart';
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Image.asset(
                'svg.jpg',
                width: 320,
                height: 320,
              ),
            ),
            const MoedasCont(),
            const MoedasMostra(),
            SizedBox( child: Align(heightFactor: 10,
              child: ElevatedButton(
                style: const ButtonStyle(),
                onPressed: () {},
                child: const Text(
                  "CONVERTER",
                ),
                // style: ButtonStyle(backgroundColor: ),
              ),
            ),
        )],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 59, 63, 66),
    );
  }
}
