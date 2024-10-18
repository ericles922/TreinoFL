import 'package:conversor_de_moedas/App/HomePageView/home_page_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
