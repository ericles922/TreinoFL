import 'package:flutter/material.dart';
import 'package:treinoapp/HelpPage.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: MainPage(),
      color: Colors.amber,
    );
  }
}
