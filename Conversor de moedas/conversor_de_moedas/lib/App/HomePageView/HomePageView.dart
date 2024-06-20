import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Image.asset(
                'images2.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton(
                      items: [],
                      onChanged: null, padding: EdgeInsets.only(top: 40),
                    ),
                  ),Expanded(child: TextField())
                ],
              ), 
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("CONVERTER"),
            ), 
          ],
        ),
      ),
    );
    //Padding(padding: EdgeInsets.only(top: 500)),
  }
}


              //width: MediaQuery.of(context).size.width,
              