import 'package:flutter/material.dart';
import "../themes/appbar.dart";
import '../size_config/size_config.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      appBar: appBar(const Color.fromARGB(255, 70, 163, 240), context),
      drawer: drawer(const Color.fromARGB(255, 1, 76, 138),
          Image.asset('assets/images/poseidon.png')),
      body: SafeArea(
          child: ListView(children: const [
        SizedBox(
            height: 300,
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Color.fromARGB(255, 184, 147, 46),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(8)),
                  Text(
                    "Today's Nutrition",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        decoration: TextDecoration.underline),
                  ),
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Carbohydrates:'),
                          Text('Total fiber:')
                        ],
                      ),
                      Column(
                        children: [Text('Protein:'), Text('Fat:')],
                      )
                    ],
                  )
                ],
              ),
            )),
        SizedBox(
            height: 300,
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Color.fromARGB(249, 157, 156, 158),
              child: Row(
                children: [
                  Text('Exercise'),
                ],
              ),
            )),
        SizedBox(
            height: 300,
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              color: Color.fromARGB(255, 197, 60, 36),
              child: Row(
                children: [
                  Text('Calendar'),
                ],
              ),
            ))
      ])),
    );
  }
}
