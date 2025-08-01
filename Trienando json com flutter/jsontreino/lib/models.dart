import 'package:dio/dio.dart';

class RepositoryMoedasMonetarias {
  final String apiKey =
      'fca_live_SUA_CHAVE_DE_API'; // Substitua pela sua chave de API REAL
  final String baseUrl = 'https://api.freecurrencyapi.com/v1';
  late Dio dio;

  RepositoryMoedasMonetarias() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<RetornoMoedasMonetarias?> getLatestRates({
    required String currencies,
    String baseCurrency = 'USD',
  }) async {
    try {
      final String rota =
          '/latest?apikey=$apiKey&currencies=$currencies&base_currency=$baseCurrency';
      final response = await dio.get(rota);

      if (response.statusCode == 200) {
        return RetornoMoedasMonetarias.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Erro ao buscar taxas de câmbio: $e');
    }
  }
}

class RetornoMoedasMonetarias {
  Data? data;

  RetornoMoedasMonetarias({this.data});

  RetornoMoedasMonetarias.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  double? bRL;
  double? cAD;
  double? eUR;
  double? gBP;
  double? uSD;

  Data({this.bRL, this.cAD, this.eUR, this.gBP, this.uSD});

  Data.fromJson(Map<String, dynamic> json) {
    bRL = (json['BRL'] as num?)?.toDouble();
    cAD = (json['CAD'] as num?)?.toDouble();
    eUR = (json['EUR'] as num?)?.toDouble();
    gBP = (json['GBP'] as num?)?.toDouble();
    uSD = (json['USD'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BRL'] = bRL;
    data['CAD'] = cAD;
    data['EUR'] = eUR;
    data['GBP'] = gBP;
    data['USD'] = uSD;
    return data;
  }

}
