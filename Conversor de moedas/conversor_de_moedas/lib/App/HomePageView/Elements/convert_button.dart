import 'package:conversor_de_moedas/App/HomePageView/Controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        fixedSize: MaterialStatePropertyAll(Size(100.w, 20.h)),
        backgroundColor: MaterialStateProperty.all(
          const Color.fromARGB(108, 136, 115, 59),
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
          color: Colors.amber,
        ),
      ),
    );
  }
}
