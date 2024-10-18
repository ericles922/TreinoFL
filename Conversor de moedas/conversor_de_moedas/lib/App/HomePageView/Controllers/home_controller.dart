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
    moedas = RepositoryMoedasMonetarias().index();
    fromMoedas = moedas[indexMoedasFrom];
    toMoedas = moedas[indexModeasTo];
    _atualizarTaxasIniciais();
  }

  void alteraMoedasFrom(int? value) {
    indexMoedasFrom = value ?? 0;
    fromMoedas = moedas[indexMoedasFrom]; // Atualiza após alteração
  }

  void alteraMoedasTo(int? value) {
    indexModeasTo = value ?? 1;
    toMoedas = moedas[indexModeasTo]; // Atualiza após alteração
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
    var toRate;
    var fromRate;

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
      toTextMoedas.text = 'Erro na conversão';
      print('Erro na conversão: fromRate ou toRate é nulo ou zero.');
    }
  }
}
