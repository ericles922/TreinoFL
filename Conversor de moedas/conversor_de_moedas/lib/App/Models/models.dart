class MoedasMonetarias {
  String name;
  double real;
  double dolar;
  double euro;
  double libra;
  double bitcoin;

  MoedasMonetarias({
    required this.name,
    required this.real ,
    required this.dolar,
    required this.euro,
    required this.libra,
    required this.bitcoin,
  });

  factory MoedasMonetarias.fromJson(Map<String, dynamic> json) {
    return MoedasMonetarias(
      name: json['name'] as String,
      real: (json['BRL'] as num?)?.toDouble() ?? 0.0,
      dolar: (json['USD'] as num?)?.toDouble() ?? 0.0,
      euro: (json['EUR'] as num?)?.toDouble() ?? 0.0,
      libra: (json['GBP'] as num?)?.toDouble() ?? 0.0,
      bitcoin: (json['bitcoin'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'real': real,
      'dolar': dolar,
      'euro': euro,
      'libra': libra,
      'bitcoin': bitcoin,
    };
  }
}
