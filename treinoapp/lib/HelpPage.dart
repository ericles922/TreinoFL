// ignore_for_file: file_names
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

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
        backgroundColor: const Color.fromARGB(
          255,
          212,
          195,
          195,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(
              20,
            ),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Nome do Colaborador',
                labelStyle: TextStyle(
                  color: Colors.grey,
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
              controller: controladorSenha,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                constraints: BoxConstraints(
                  maxWidth: 380,
                ),
              ),
              controller: controladorSenha,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String name = controladorName.text;
              String senha = controladorSenha.text;
            },
            child: const Text(
              'Salvar',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}

class Usuario {
  String? name;
  String? senha;

  Usuario({required this.name, required this.senha});
}
