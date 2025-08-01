import 'package:conversor_de_moedas/App/HomePageView/Controllers/home_controller.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/to_cripto_containers.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/ButtonsAndTextF/from_cripto_containers.dart';
import 'package:conversor_de_moedas/App/HomePageView/Elements/convert_button.dart';
import "package:conversor_de_moedas/repositories/repository_moedas_monetarias.dart";
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: Image.asset(
              'assets/svg.jpg',
              width: 250.w, // Usando ScreenUtil para largura responsiva
              height: 270.h, // Usando ScreenUtil para altura responsiva
            ),
          ),
          MoedasCont(homeController: homeController),
          SizedBox(
            height: 50.h,
            width: 50.w,
          ),
          MoedasMostra(homeController: homeController),
          SizedBox(
            child: Align(
              heightFactor: 7,
              child: Convertbutton(
                homeController: homeController,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 59, 63, 66),
    );
  }
}
