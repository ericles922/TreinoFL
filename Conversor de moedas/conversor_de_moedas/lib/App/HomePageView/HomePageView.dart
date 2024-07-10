import 'package:conversor_de_moedas/App/Models/models.dart';
import 'package:conversor_de_moedas/repositories/repositorie_moedas_monetarias.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  RepositorieMoedasMonetarias repository = RepositorieMoedasMonetarias();

  int positionDropdown = 1;

  @override
  Widget build(BuildContext context) {
    List<MoedasMonetarias> moedas = repository.index();

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                child: Image.asset(
                  'svg.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              /*  Expanded(
                child: ListView.builder(
                  itemCount: moedas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(moedas.elementAt(index).name),
                    );
                  },
                ),
              ),
              */
              //ListView() Estudar Depois **Não esquecer!!!!
              Row(
                children: [
                  Container(
                    alignment: AlignmentDirectional(5, 10),
                    width: 100,
                    height: 50,
                    child: DropdownButton(icon: Icon(Icons.arrow_drop_down,color: Colors.amber),
                      dropdownColor: Color.fromRGBO(59, 63, 66, 1),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      value: positionDropdown,
                      items: [
                        DropdownMenuItem(
                            value: 1,
                            child: Text("Real",
                                style: TextStyle(color: Colors.amber))),
                        DropdownMenuItem(
                            value: 2,
                            child: Text("Dolar",
                                style: TextStyle(color: Colors.amber))),
                        DropdownMenuItem(
                            value: 3,
                            child: Text("Euro",
                                style: TextStyle(color: Colors.amber))),
                        DropdownMenuItem(
                            value: 4,
                            child: Text("Libra",
                                style: TextStyle(color: Colors.amber))),
                        DropdownMenuItem(
                            value: 5,
                            child: Text("Bitcoin",
                                style: TextStyle(color: Colors.amber)))
                      ],
                      onChanged: (value) {
                        setState(() => positionDropdown = value ?? 1);
                      },
                      padding: const EdgeInsets.only(top: 20),
                    ),
                  ), //TextField(decoration: InputDecoration(counterText: 'Valor'),)
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("CONVERTER",
                ),
               // style: ButtonStyle(backgroundColor: ),
              ),
            ],
          ),
        ),backgroundColor: const Color.fromRGBO(59, 63, 66, 1),
      );
      
  }
}
