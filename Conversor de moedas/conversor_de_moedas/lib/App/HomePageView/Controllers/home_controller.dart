import 'package:conversor_de_moedas/App/Models/models.dart';
import 'package:flutter/material.dart';
import '../../../repositories/repositorie_moedas_monetarias.dart';

class HomeController {
  late List<MoedasMonetarias> moedas;
  late MoedasMonetarias toMoedas;
  late MoedasMonetarias fromMoedas;

  int indexMoedasFrom = 0;
  int indexModeasTo = 1;

  final TextEditingController toTextMoedas = TextEditingController();
  final TextEditingController fromTextMoedas = TextEditingController();

  HomeController() {
    moedas = RepositorieMoedasMonetarias().index();
    fromMoedas = moedas[indexMoedasFrom];
    toMoedas = moedas[indexModeasTo];
  }

  void alteraMoedasFrom(int? value) {
    indexMoedasFrom = value ?? 1;
  }

  void alteraMoedasTo(int? value) {
    indexModeasTo = value ?? 1;
  }

  void convert() {
    String text = fromTextMoedas.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    fromMoedas = moedas[indexMoedasFrom];
    toMoedas = moedas[indexModeasTo];

    if (fromMoedas.name == 'Real') {
      returnValue = value * toMoedas.real;
    } else if (fromMoedas.name == 'Real') {
      returnValue = value * toMoedas.dolar;
    } else if (fromMoedas.name == 'Real') {
      returnValue = value * toMoedas.libra;
    } else if (fromMoedas.name == 'Real') {
      returnValue = value * toMoedas.euro;
    } else if (fromMoedas.name == 'Real') {
      returnValue = value * toMoedas.bitcoin;
    } else if (fromMoedas.name == 'Dolar') {
      returnValue = value * toMoedas.dolar;
    } else if (fromMoedas.name == 'Dolar') {
      returnValue = value * toMoedas.real;
    } else if (fromMoedas.name == 'Dolar') {
      returnValue = value * toMoedas.euro;
    } else if (fromMoedas.name == 'Dolar') {
      returnValue = value * toMoedas.libra;
    } else if (fromMoedas.name == 'Dolar') {
      returnValue = value * toMoedas.bitcoin;
    } else if (fromMoedas.name == 'Euro') {
      returnValue = value * toMoedas.euro;
    } else if (fromMoedas.name == 'Euro') {
      returnValue = value * toMoedas.dolar;
    } else if (fromMoedas.name == 'Euro') {
      returnValue = value * toMoedas.real;
    } else if (fromMoedas.name == 'Euro') {
      returnValue = value * toMoedas.libra;
    } else if (fromMoedas.name == 'Euro') {
      returnValue = value * toMoedas.bitcoin;
    } else if (fromMoedas.name == 'Libra') {
      returnValue = value * toMoedas.libra;
    } else if (fromMoedas.name == 'Libra') {
      returnValue = value * toMoedas.dolar;
    } else if (fromMoedas.name == 'Libra') {
      returnValue = value * toMoedas.real;
    } else if (fromMoedas.name == 'Libra') {
      returnValue = value * toMoedas.euro;
    } else if (fromMoedas.name == 'Libra') {
      returnValue = value * toMoedas.bitcoin;
    } else if (fromMoedas.name == 'Bitcoin') {
      returnValue = value * toMoedas.bitcoin;
    } else if (fromMoedas.name == 'Bitcoin') {
      returnValue = value * toMoedas.real;
    } else if (fromMoedas.name == 'Bitcoin') {
      returnValue = value * toMoedas.dolar;
    } else if (fromMoedas.name == 'Bitcoin') {
      returnValue = value * toMoedas.libra;
    } else if (fromMoedas.name == 'Bitcoin') {
      returnValue = value * toMoedas.euro;
    }
    toTextMoedas.text = returnValue.toStringAsFixed(2);
  }
}
