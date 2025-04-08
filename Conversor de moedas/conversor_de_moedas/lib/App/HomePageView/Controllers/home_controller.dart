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
    fromMoedas = moedas[indexMoedasFrom];
  }

  void alteraMoedasTo(int? value) {
    indexModeasTo = value ?? 1;
    toMoedas = moedas[indexModeasTo];
  }

  void convert() {
    String text = fromTextMoedas.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    fromMoedas = moedas[indexMoedasFrom];
    toMoedas = moedas[indexModeasTo];

    {
      final conversionMap = {
        'Real': fromMoedas.real,
        'Dolar': fromMoedas.dolar,
        'Euro': fromMoedas.euro,
        'Libra': fromMoedas.libra,
        'Bitcoin': fromMoedas.bitcoin,
      };

      returnValue = value * (conversionMap[toMoedas.name] ?? 1.0);
    }

    if (toMoedas.name == 'Bitcoin') {
      toTextMoedas.text = returnValue.toStringAsFixed(8);
    } else {
      toTextMoedas.text = returnValue.toStringAsFixed(2);
    }
  }
}
