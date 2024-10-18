import 'package:conversor_de_moedas/App/Models/models.dart';

class RepositoryMoedasMonetarias { 
  List<MoedasMonetarias> index() {
    return <MoedasMonetarias>[
      MoedasMonetarias(
          name: 'Real',
          real: 1.0,
          dolar: 0.18,
          euro: 0.16,
          libra: 0.14,
          bitcoin: 0.0000026),
      MoedasMonetarias(
          name: 'Dolar',
          real: 5.68,
          dolar: 1.0,
          euro: 0.92,
          libra: 0.77,
          bitcoin: 0.000015),
      MoedasMonetarias(
          name: 'Euro',
          real: 5.82,
          dolar: 1.3,
          euro: 1.0,
          libra: 0.84,
          bitcoin: 0.000016),
      MoedasMonetarias(
          name: 'Libra',
          real: 7.41,
          dolar: 1.3,
          euro: 1.2,
          libra: 1.0,
          bitcoin: 0.000019),
      MoedasMonetarias( 
        name: 'Bitcoin',
        real: 384179.94,
        dolar: 67716.29,
        euro: 62565.17,
        libra: 51923.67,
        bitcoin: 1.0,
      ),
    ];
  }
}
