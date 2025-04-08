import 'package:conversor_de_moedas/App/HomePageView/Controllers/home_controller.dart';
import 'package:flutter/material.dart';

class Convertbutton extends StatefulWidget {
  final HomeController homeController;

  const Convertbutton({super.key, required this.homeController});

  @override
  State<Convertbutton> createState() => _ConvertbuttonState();
}

class _ConvertbuttonState extends State<Convertbutton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          const Color.fromRGBO(255, 255, 255, 1),
        ),
        overlayColor: const WidgetStatePropertyAll(
          Color.fromARGB(255, 102, 100, 100),
        ),
        foregroundColor:
            const WidgetStatePropertyAll(Color.fromARGB(255, 255, 255, 255)),
      ),
      onPressed: () {
        setState(() {
          widget.homeController.convert();
        });
      },
      child: const Text(
        "CONVERTER",
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
