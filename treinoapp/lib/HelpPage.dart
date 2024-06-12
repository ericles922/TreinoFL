// ignore_for_file: file_names
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  bool _status = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Configurações do Viveiro',
        ),
        leading: const Icon(
          Icons.arrow_back,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: <Widget>[
          //Expanded(),
          Expanded(
            child: ListTile(
              title: const Text('Viverio DP1',
                  style: TextStyle(
                    fontSize: 35
                    ,), 
                  textAlign: TextAlign.right
                  ,),
              trailing: Icon(
                Icons.edit_outlined,
                textDirection: TextDirection.rtl,
              ),
              horizontalTitleGap: 1,
              titleAlignment: ListTileTitleAlignment.center,
              contentPadding: EdgeInsets.only(
                right: 200,
              ),
            ),
          ),
          SwitchListTile(
            value: _status,
            onChanged: (val) {
              setState(() {
                _status = val;
              });
            },
            title: const Text(
              "Viveiro Ativo?",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            activeColor: const Color.fromARGB(255, 255, 255, 255),
            controlAffinity: ListTileControlAffinity.leading,
            contentPadding: EdgeInsets.only(bottom: 500, left: 10),
            activeTrackColor: Colors.brown,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

          ),
          FilledButton(
            onPressed: () {},
            child: Text(
              "Alterar",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.brown,
              ),
              fixedSize: MaterialStatePropertyAll(
                Size.fromWidth(
                  480,
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 20))
        ],
      ),
    );
  }
}
