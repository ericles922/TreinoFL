import 'package:conversor_de_moedas/App/HomePageView/HomePageView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePageView(),
    );
  }
}