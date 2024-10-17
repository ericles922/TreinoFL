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
<<<<<<< HEAD
      debugShowCheckedModeBanner: false,
=======
>>>>>>> 1f2da6f26869f0437e57cd3b892c7539337b615d
      home: HomePageView(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
