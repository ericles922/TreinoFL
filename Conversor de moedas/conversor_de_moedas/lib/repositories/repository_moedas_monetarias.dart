import 'package:dio/dio.dart';
import 'package:conversor_de_moedas/App/Models/models.dart';

class RepositoryMoedasMonetarias {
  final String apiKey =
      'fca_live_9H9X1DluEixE3wefCQl1r9E5lH3AFULlllhE1Mef'; // Substitua pela sua chave de API
  final String baseUrl = 'https://api.freecurrencyapi.com/v1';
  late Dio dio;
  List<MoedasMonetarias> moedas = [];

  RepositoryMoedasMonetarias() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<void> atualizarTaxas({String? toCurrency}) async {
    try {
      const String baseCurrency = 'BRL';
      String currencies = toCurrency ?? 'USD';
      final String rota =
          'https://api.freecurrencyapi.com/v1/latest?&apiKey=$apiKey&currencies=$currencies&base_currency=$baseCurrency';
      
      final Response response = await dio.get(rota);
      print(response.data);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data['data'];
        if (data != null && data.isNotEmpty) {
          final String targetCurrency = data.keys.first;
          final double rate = data.values.first.toDouble();

          for (var moeda in moedas) {
            if (moeda.name == 'BRL') {
              switch (targetCurrency) {
                case 'USD':
                  moeda.dolar = rate;
                  break;
                case 'EUR':
                  moeda.euro = rate;
                  break;
                case 'GBP':
                  moeda.libra = rate;
                  break;
                case 'BTC': // Adicione a lógica para Bitcoin
                  moeda.bitcoin = rate;
                  break;
                // Adicione outros casos para outras moedas fiduciárias
              }
            } else if (moeda.name == targetCurrency) {
              moeda.real = 1 / rate;
              switch (targetCurrency) {
                case 'USD':
                  break;
                case 'EUR':
                  break;
                case 'GBP':
                  break;
                case 'BTC': // Adicione a lógica para Bitcoin (taxa de BTC para outras moedas, se necessário)
                  break;
              }
            }
          }
          print(
              'Moedas atualizadas: ${moedas.map((m) => m.toJson()).toList()}');
        } else {
          print(
              'Erro: Formato da resposta da API inválido (data vazio ou não encontrado).');
        }
      } else {
        print('Erro ao buscar taxas de câmbio: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro de conexão ou ao processar a resposta: $e');
    }
  }

  List<MoedasMonetarias> index() {
    return <MoedasMonetarias>[
      MoedasMonetarias(
          name: 'Real',
          real: 1.0,
          dolar: 0.1668,
          euro: 0.1527,
          libra: 0.1315,
          bitcoin: 0.00000213),
      MoedasMonetarias(
          name: 'Dolar',
          real: 5.9949,
          dolar: 1.0,
          euro: 0.9166,
          libra: 0.7839,
          bitcoin: 0.00001277),
      MoedasMonetarias(
          name: 'Euro',
          real: 6.5476,
          dolar: 1.0911,
          euro: 1.0,
          libra: 0.9119,
          bitcoin: 0.00001389),
      MoedasMonetarias(
          name: 'Libra',
          real: 7.6032,
          dolar: 1.2758,
          euro: 1.1691,
          libra: 1.0,
          bitcoin: 0.00001627),
      MoedasMonetarias(
          name: 'Bitcoin',
          real: 469389.33,
          dolar: 78280.00,
          euro: 72000.00,
          libra: 61400.00,
          bitcoin: 1.0),
    ];
  }

  // Método para obter as taxas atualizadas (pode ser chamado explicitamente)
  Future<List<MoedasMonetarias>> getTaxasAtualizadas() async {
    await atualizarTaxas();
    return moedas;
  }
}
