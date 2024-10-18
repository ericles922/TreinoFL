import 'package:conversor_de_moedas/App/HomePageView/Controllers/home_controller.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/to_cripto_containers.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/from_cripto_containers.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/convert_button.dart';
import "package:conversor_de_moedas/repositories/repository_moedas_monetarias.dart";
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  RepositoryMoedasMonetarias repository = RepositoryMoedasMonetarias();
  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    //List<MoedasMonetarias> moedas = repository.index();

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            child: Image.asset('svg.jpg', width: 320, height: 320),
          ),
          MoedasCont(homeController: homeController),
          const SizedBox(height: 20),
          MoedasMostra(homeController: homeController),
          SizedBox(
            child: Align(
              heightFactor: 7,
              child: Convertbutton(homeController: homeController),
            ),
          )
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 59, 63, 66),
    );
  }
}
