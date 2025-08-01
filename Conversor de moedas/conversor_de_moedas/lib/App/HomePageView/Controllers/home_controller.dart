import 'package:conversor_de_moedas/App/Models/models.dart';
import 'package:flutter/material.dart';
import 'package:conversor_de_moedas/repositories/repository_moedas_monetarias.dart'; // Importe o repositório

class HomeController extends ChangeNotifier {
  List<MoedasMonetarias> moedas = [];
  late MoedasMonetarias toMoedas;
  late MoedasMonetarias fromMoedas;

  int indexMoedasFrom = 0;
  int indexModeasTo = 1;

  final TextEditingController toTextMoedas = TextEditingController();
  final TextEditingController fromTextMoedas = TextEditingController();

  final RepositoryMoedasMonetarias _repository = RepositoryMoedasMonetarias();

  HomeController() {
    _inicializarMoedas();
  }

  Future<void> _inicializarMoedas() async {
    try {
      moedas = await _repository.fetchAndIndex();

      if (moedas.isNotEmpty) {
        indexMoedasFrom = 0;
        indexModeasTo = 1;
        if (moedas.length <= indexModeasTo) {
          indexModeasTo = moedas.isNotEmpty ? moedas.length - 1 : 0;
        }
        fromMoedas = moedas[indexMoedasFrom];
        toMoedas = moedas[indexModeasTo];
      } else {
        fromMoedas = MoedasMonetarias(
            name: 'Real',
            real: 1.0,
            dolar: 0.0,
            euro: 0.0,
            libra: 0.0,
            bitcoin: 0.0);
        toMoedas = MoedasMonetarias(
            name: 'Dolar',
            real: 0.0,
            dolar: 1.0,
            euro: 0.0,
            libra: 0.0,
            bitcoin: 0.0);
        moedas = [fromMoedas, toMoedas];
      }
    } catch (e) {
      // Em caso de erro, inicialize com valores padrão
      fromMoedas = MoedasMonetarias(
          name: 'Real',
          real: 1.0,
          dolar: 0.0,
          euro: 0.0,
          libra: 0.0,
          bitcoin: 0.0);
      toMoedas = MoedasMonetarias(
          name: 'Dolar',
          real: 0.0,
          dolar: 1.0,
          euro: 0.0,
          libra: 0.0,
          bitcoin: 0.0);
      moedas = [fromMoedas, toMoedas]; // Adiciona as moedas padrão à lista
    } finally {
      notifyListeners(); // Notifica os ouvintes após a inicialização (sucesso ou falha)
    }
  }

  void alteraMoedasFrom(int? value) {
    if (moedas.isNotEmpty &&
        value != null &&
        value >= 0 &&
        value < moedas.length) {
      indexMoedasFrom = value;
      fromMoedas = moedas[indexMoedasFrom];
      notifyListeners();
      convert(); // Converte automaticamente após a mudança da moeda de origem
    } else {}
  }

  void alteraMoedasTo(int? value) {
    if (moedas.isNotEmpty &&
        value != null &&
        value >= 0 &&
        value < moedas.length) {
      indexModeasTo = value;
      toMoedas = moedas[indexModeasTo];
      notifyListeners();
      convert(); // Converte automaticamente após a mudança da moeda de destino
    } else {}
  }

  Future<void> convert() async {
    String text = fromTextMoedas.text;
    double value = double.tryParse(text) ??
        0.0; // Use 0.0 como padrão para evitar cálculos com 1.0 se o campo estiver vazio
    double returnValue = 0;

    // Se as moedas são as mesmas, o valor é o mesmo
    if (fromMoedas.name == toMoedas.name) {
      toTextMoedas.text = value.toStringAsFixed(2);
      return;
    }

    // Acessa as taxas de conversão diretamente do objeto fromMoedas,
    // que já contém as taxas relativas a outras moedas.
    // Usamos um switch para determinar qual taxa aplicar.
    switch (toMoedas.name) {
      case 'Real':
        returnValue = value * fromMoedas.real;
        break;
      case 'Dolar':
        returnValue = value * fromMoedas.dolar;
        break;
      case 'Euro':
        returnValue = value * fromMoedas.euro;
        break;
      case 'Libra':
        returnValue = value * fromMoedas.libra;
        break;
      case 'Bitcoin':
        returnValue = value * fromMoedas.bitcoin;
        break;
      default:
        toTextMoedas.text = 'Erro: Moeda de destino desconhecida.';
        return;
    }

    // Formata o resultado com base na moeda de destino (Bitcoin com mais casas decimais)
    if (toMoedas.name == 'Bitcoin') {
      toTextMoedas.text = returnValue.toStringAsFixed(8);
    } else {
      toTextMoedas.text = returnValue.toStringAsFixed(2);
    }
  }
}
