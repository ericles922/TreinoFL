// ignore_for_file: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:treinoapp/Database/DatabaseHelper.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});


  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

 TextEditingController controladorSenha = TextEditingController();
   TextEditingController controladorName = TextEditingController();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cadastros de Funcionários',
        ),
        leading: const Icon(
          Icons.arrow_back,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 30),
            child:  TextField(
              decoration: InputDecoration(
                labelText: 'Nome do Colaborador',
                labelStyle: TextStyle(
                  color: Colors.grey
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                constraints: BoxConstraints(maxWidth: 380),
              ), 
              controller: controladorSenha
            ),
          ),
          Container( 
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 20),
            child:  TextField(
              decoration: InputDecoration(
                labelText: 'Senha', 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                labelStyle: TextStyle(color: Colors.grey),
                constraints: BoxConstraints(maxWidth: 380),
              ), controller: controladorSenha
            ),
          ),
          ElevatedButton(
            onPressed: (){
                 String name = controladorName.text;
                   String? senha = controladorSenha.text;
              },
            child: Text(
              'Salvar',
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
  
}
class Funcionario {
  final String name;
  final int senha;

  Funcionario(
    this.name,
    this.senha
  );
}