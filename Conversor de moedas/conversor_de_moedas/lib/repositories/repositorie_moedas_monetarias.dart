import 'package:conversor_de_moedas/App/Models/models.dart';

class RepositorieMoedasMonetarias {
  List<MoedasMonetarias> index() {
    return <MoedasMonetarias>[
      MoedasMonetarias(
          name: 'Real',
          real: 1.0,
          dolar: 0.18,
          euro: 0.17,
          libra: 0.15,
          bitcoin: 0.0000028),
      MoedasMonetarias(
          name: 'Dolar',
          real: 5.42,
          dolar: 1.0,
          euro: 0.93,
          libra: 0.79,
          bitcoin: 0.000015),
      MoedasMonetarias(
          name: 'Euro',
          real: 5.82,
          dolar: 1.07,
          euro: 1.0,
          libra: 0.85,
          bitcoin: 0.000019),
      MoedasMonetarias(
          name: 'Libra',
          real: 6.88,
          dolar: 1.27,
          euro: 1.18,
          libra: 1.0,
          bitcoin: 0.000019),
      MoedasMonetarias(
        name: 'Bitcoin',
        real: 0.0000028,
        dolar: 0.000015,
        euro: 0.000019,
        libra: 0.000019,
        bitcoin: 1.0,
      ),
    ];
  }
}
