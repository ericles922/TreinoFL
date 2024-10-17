import 'package:conversor_de_moedas/App/HomePageView/homepageview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageView(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
