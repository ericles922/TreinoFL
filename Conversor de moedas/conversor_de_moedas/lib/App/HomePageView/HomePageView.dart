import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/from_cripto_containers.dart';
import "package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/to_cripto_containers.dart";
import "package:conversor_de_moedas/repositories/repositorie_moedas_monetarias.dart";
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  RepositorieMoedasMonetarias repository = RepositorieMoedasMonetarias();

  @override
  Widget build(BuildContext context) {
    //List<MoedasMonetarias> moedas = repository.index();

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
            const SizedBox(
              height: 20,
            ),
            const MoedasMostra(),
            SizedBox(
              child: Align(
                heightFactor: 10,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(109, 130, 123, 104))),
                  onPressed: () {},
                  child: const Text(
                    "CONVERTER",
                    style: TextStyle(color: Colors.amber),
                  ),
                  // style: ButtonStyle(backgroundColor: ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 59, 63, 66),
    );
  }
}
