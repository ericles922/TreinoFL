import 'package:conversor_de_moedas/App/Models/models.dart';
import 'package:flutter/material.dart';
import '../../../repositories/repositorie_moedas_monetarias.dart';


class HomeController {
  late List<MoedasMonetarias> moedas;
  late MoedasMonetarias toMoedas;
  late MoedasMonetarias fromMoedas;

  final TextEditingController toTextMoedas = TextEditingController();
  final TextEditingController fromTextMoedas = TextEditingController();

  HomeController() {
    moedas = RepositorieMoedasMonetarias().index();
    toMoedas = moedas[0];
    fromMoedas = moedas[1];
  }

  void convert() {
    String text = toTextMoedas.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    if (fromMoedas.name == 'Real') {
      returnValue = value * toMoedas.real;
    } else if (fromMoedas.name == 'Dolar') {
      returnValue = value * toMoedas.dolar;
    } else if (fromMoedas.name == 'Euro') {
      returnValue = value * toMoedas.euro;
    } else if (fromMoedas.name == 'Libra') {
      returnValue = value * toMoedas.libra;
    } else if (fromMoedas.name == 'Bitcoin') {
    returnValue = value * toMoedas.bitcoin;
  }
    fromMoedas.text = returnValue.toStringAsFixed(2);
  }
}
