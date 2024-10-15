import 'package:flutter/material.dart';
import 'package:nubank_app/homePageView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePageView(),
    );
  }
}
