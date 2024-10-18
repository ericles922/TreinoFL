import 'package:conversor_de_moedas/App/Models/models.dart';
import 'package:flutter/material.dart';
import '../../../repositories/repository_moedas_monetarias.dart';

class HomeController {
  late List<MoedasMonetarias> moedas;
  late MoedasMonetarias toMoedas;
  late MoedasMonetarias fromMoedas;

  int indexMoedasFrom = 0;
  int indexModeasTo = 1;

  final TextEditingController toTextMoedas = TextEditingController();
  final TextEditingController fromTextMoedas = TextEditingController();

  HomeController() {
    moedas = RepositoryMoedasMonetarias().index();
    fromMoedas = moedas[indexMoedasFrom];
    toMoedas = moedas[indexModeasTo];
  }

  void alteraMoedasFrom(int? value) {
    indexMoedasFrom = value ?? 0;
    fromMoedas = moedas[indexMoedasFrom]; // Atualiza após alteração
  }

  void alteraMoedasTo(int? value) {
    indexModeasTo = value ?? 1;
    toMoedas = moedas[indexModeasTo]; // Atualiza após alteração
  }

  void convert() {
    String text = fromTextMoedas.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    fromMoedas = moedas[indexMoedasFrom];
    toMoedas = moedas[indexModeasTo];

    if (fromMoedas.name == 'Real' && toMoedas.name == 'Dolar') {
      returnValue = value /
          fromMoedas.dolar; // Correção: Divide o valor em reais pela taxa
    } else if (fromMoedas.name == 'Dolar' && toMoedas.name == 'Real') {
      returnValue =
          value * toMoedas.real; // Conversão correta de Dólar para Real
    } else {
      // Lógica para outras conversões (adapte conforme necessário)
      final conversionMap = {
        'Real': toMoedas.real,
        'Dolar': toMoedas.dolar,
        'Euro': toMoedas.euro,
        'Libra': toMoedas.libra,
        'Bitcoin': toMoedas.bitcoin,
      };

      returnValue = value * (conversionMap[fromMoedas.name] ?? 1.0);
    }

    if (toMoedas.name == 'Bitcoin') {
      toTextMoedas.text = returnValue.toStringAsFixed(8);
    } else {
      toTextMoedas.text = returnValue.toStringAsFixed(2);
    }
  }
}
