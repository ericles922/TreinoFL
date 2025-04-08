import 'package:conversor_de_moedas/App/Models/models.dart';
import 'package:flutter/material.dart';
import '../../../repositories/repository_moedas_monetarias.dart';

class HomeController extends ChangeNotifier {
  late List<MoedasMonetarias> moedas;
  late MoedasMonetarias toMoedas;
  late MoedasMonetarias fromMoedas;

  int indexMoedasFrom = 0;
  int indexModeasTo = 1;

  final TextEditingController toTextMoedas = TextEditingController();
  final TextEditingController fromTextMoedas = TextEditingController();
  final RepositoryMoedasMonetarias repository = RepositoryMoedasMonetarias();

  HomeController() {
    moedas = repository.index();
    fromMoedas = moedas[indexMoedasFrom];
    toMoedas = moedas[indexModeasTo];
    _atualizarTaxasIniciais();
  }

  void alteraMoedasFrom(int? value) {
    indexMoedasFrom = value ?? 0;
    fromMoedas = moedas[indexMoedasFrom];
    notifyListeners();
  }

  void alteraMoedasTo(int? value) {
    indexModeasTo = value ?? 1;
    toMoedas = moedas[indexModeasTo];
    notifyListeners();
  }

  Future<void> _atualizarTaxasIniciais() async {
    await repository.atualizarTaxas(toCurrency: 'USD');
    await repository.atualizarTaxas(toCurrency: 'EUR');
    await repository.atualizarTaxas(toCurrency: 'GBP');
    // Lógica para buscar taxa de Bitcoin (se aplicável)
    moedas = repository.moedas;
    print(
        'Lista de moedas após inicialização: ${moedas.map((m) => m.toJson()).toList()}'); // ADICIONE ESTE PRINT
    fromMoedas = moedas[indexMoedasFrom];
    toMoedas = moedas[indexModeasTo];
    notifyListeners();
  }

  Future<void> atualizarTaxas({String? toCurrency}) async {
    await repository.atualizarTaxas(toCurrency: toCurrency);
    moedas = repository.moedas;
    print(
        'Lista de moedas após atualização: ${moedas.map((m) => m.toJson()).toList()}'); // ADICIONE ESTE PRINT
    fromMoedas = moedas[indexMoedasFrom];
    toMoedas = moedas[indexModeasTo];
    notifyListeners();
  }

  Future<void> convert() async {
    String text = fromTextMoedas.text;
    double value = double.tryParse(text) ?? 1.0;
    double returnValue = 0;

    fromMoedas = moedas[indexMoedasFrom];
    toMoedas = moedas[indexModeasTo];

    double? fromRate = 0.0;
    double? toRate = 0.0;

    switch (fromMoedas.name) {
      case 'Real':
        fromRate = 1.0;
        break;
      case 'Dolar':
        fromRate = fromMoedas.dolar;
        break;
      case 'Euro':
        fromRate = fromMoedas.euro;
        break;
      case 'Libra':
        fromRate = fromMoedas.libra;
        break;
      case 'Bitcoin':
        fromRate = fromMoedas.bitcoin;
        break;
    }

    switch (toMoedas.name) {
      case 'Real':
        toRate = 1.0;
        break;
      case 'Dolar':
        toRate = toMoedas.dolar;
        break;
      case 'Euro':
        toRate = toMoedas.euro;
        break;
      case 'Libra':
        toRate = toMoedas.libra;
        break;
      case 'Bitcoin':
        toRate = toMoedas.bitcoin;
        break;
    }

    print('Taxa da moeda de origem (fromRate): $fromRate');
    print('Taxa da moeda de destino (toRate): $toRate');

    if (fromRate != null && toRate != null && fromRate != 0 && toRate != 0) {
      returnValue = value * (toRate / fromRate);
      if (toMoedas.name == 'Bitcoin') {
        toTextMoedas.text = returnValue.toStringAsFixed(8);
      } else {
        toTextMoedas.text = returnValue.toStringAsFixed(2);
      }
      print('Resultado da conversão: $returnValue');
    } else {
      toTextMoedas.text = 'Erro na conversão';
      print('Erro na conversão: fromRate ou toRate é nulo ou zero.');
    }
  }
}
