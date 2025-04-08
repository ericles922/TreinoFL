import 'package:conversor_de_moedas/App/HomePageView/Controllers/home_controller.dart';
import 'package:flutter/material.dart';

class Convertbutton extends StatefulWidget {
  final HomeController homeController;

  const Convertbutton({Key? key, required this.homeController})
      : super(key: key);

  @override
  State<Convertbutton> createState() => _ConvertbuttonState();
}

class _ConvertbuttonState extends State<Convertbutton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(108, 136, 115, 59),
        ),
      ),
      onPressed: () {
        setState(() {
          widget.homeController.convert();
        });
      },
      child: const Text(
        "CONVERTER",
        style: TextStyle(
          color: Colors.amber,
        ),
      ),
    );
  }
}
