import 'package:conversor_de_moedas/App/Models/models.dart';
import 'package:http/http.dart' as http; // Importe o pacote http
import 'dart:convert'; // Para decodificar JSON

class RepositoryMoedasMonetarias {
  // O método index agora é assíncrono e busca os dados da API
  Future<List<MoedasMonetarias>> fetchAndIndex() async {
    const String baseUrl =
        'https://latest.currency-api.pages.dev/v1/currencies/usd.json';
    List<MoedasMonetarias> moedasList = [];

    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        // A API retorna um objeto onde a chave 'usd' contém as taxas relativas ao USD
        final Map<String, dynamic> usdRates = data['usd'];

        // Mapeamento das moedas que queremos para seus códigos de API

        // Extrai as taxas necessárias em relação ao USD
        final double usdToBrl = usdRates['brl']?.toDouble() ?? 0.0;
        final double usdToEur = usdRates['eur']?.toDouble() ?? 0.0;
        final double usdToGbp = usdRates['gbp']?.toDouble() ?? 0.0;
        final double usdToBtc = usdRates['btc']?.toDouble() ?? 0.0;


        // Verifica se a taxa de USD para BRL é válida para evitar divisão por zero
        if (usdToBrl == 0) {
          throw Exception('Taxa de USD para BRL é zero, impossível calcular.');
        }

        // Construindo a lista de MoedasMonetarias com base nas taxas da API
        // A base de cálculo interna será o Real (BRL) para consistência
        // Real
        moedasList.add(
          MoedasMonetarias(
            name: 'Real',
            real: 1.0,
            dolar: 1 / usdToBrl, // 1 Real = (1 / taxa_usd_brl) Dólar
            euro: (1 / usdToBrl) *
                usdToEur, // 1 Real = (1/taxa_usd_brl) * taxa_usd_eur Euro
            libra: (1 / usdToBrl) *
                usdToGbp, // 1 Real = (1/taxa_usd_brl) * taxa_usd_gbp Libra
            bitcoin: (1 / usdToBrl) *
                usdToBtc, // 1 Real = (1/taxa_usd_brl) * taxa_usd_btc Bitcoin
          ),
        );

        // Dolar
        moedasList.add(
          MoedasMonetarias(
            name: 'Dolar',
            real: usdToBrl, // 1 Dólar = taxa_usd_brl Reais
            dolar: 1.0,
            euro: usdToEur, // 1 Dólar = taxa_usd_eur Euro
            libra: usdToGbp, // 1 Dólar = taxa_usd_gbp Libra
            bitcoin: usdToBtc, // 1 Dólar = taxa_usd_btc Bitcoin
          ),
        );

        // Euro
        moedasList.add(
          MoedasMonetarias(
            name: 'Euro',
            real: (1 / usdToEur) *
                usdToBrl, // 1 Euro = (1/taxa_usd_eur) * taxa_usd_brl Reais
            dolar: 1 / usdToEur, // 1 Euro = (1 / taxa_usd_eur) Dólar
            euro: 1.0,
            libra: (1 / usdToEur) *
                usdToGbp, // 1 Euro = (1/taxa_usd_eur) * taxa_usd_gbp Libra
            bitcoin: (1 / usdToEur) *
                usdToBtc, // 1 Euro = (1/taxa_usd_eur) * taxa_usd_btc Bitcoin
          ),
        );

        // Libra
        moedasList.add(
          MoedasMonetarias(
            name: 'Libra',
            real: (1 / usdToGbp) *
                usdToBrl, // 1 Libra = (1/taxa_usd_gbp) * taxa_usd_brl Reais
            dolar: 1 / usdToGbp, // 1 Libra = (1 / taxa_usd_gbp) Dólar
            euro: (1 / usdToGbp) *
                usdToEur, // 1 Libra = (1/taxa_usd_gbp) * taxa_usd_eur Euro
            libra: 1.0,
            bitcoin: (1 / usdToGbp) *
                usdToBtc, // 1 Libra = (1/taxa_usd_gbp) * taxa_usd_btc Bitcoin
          ),
        );

        // Bitcoin
        moedasList.add(
          MoedasMonetarias(
            name: 'Bitcoin',
            real: (1 / usdToBtc) * usdToBrl,
            dolar: 1 / usdToBtc,
            euro: (1 / usdToBtc) * usdToEur,
            libra: (1 / usdToBtc) * usdToGbp,
            bitcoin: 1.0,
          ),
        );

  
        return moedasList;
      } else {
        throw Exception(
            'Falha ao carregar as taxas de câmbio: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar taxas de câmbio: $e');
    }
  }
}
