import 'package:flutter/material.dart';
import "../themes/appbar.dart";
import '../size_config/size_config.dart';
import "dummy_screen.dart";

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
        appBar: appBar(const Color.fromARGB(255, 70, 163, 240), context),
        drawer: drawer(const Color.fromARGB(255, 1, 76, 138),
            Image.asset('assets/images/poseidon.png'), context),
        body: ListView(children: [
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(DummyScreen.routeName);
              },
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                margin: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/Firefly food.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  )),
                  child: Column(children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 30),
                      color: Colors.white.withOpacity(0.8),
                      child: const Text(
                        "Today's Calories",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 45),
                      alignment: Alignment.center,
                      width: 250,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        "- kCal",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 350,
                      margin: const EdgeInsets.only(top: 45),
                      child: const Text(
                        'details >>',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(DummyScreen.routeName);
            },
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Firefly exercise.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.white.withOpacity(0.8),
                      margin: const EdgeInsets.only(top: 30),
                      child: const Text(
                        "Exercise",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 45),
                      alignment: Alignment.center,
                      width: 250,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        "- Day",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 350,
                      margin: const EdgeInsets.only(top: 45),
                      child: const Text(
                        'details >>',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(DummyScreen.routeName);
            },
            child: Card(
              elevation: 5,
              shadowColor: Colors.black,
              margin: const EdgeInsets.all(10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/Firefly calendar.jpg'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                )),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.white.withOpacity(0.8),
                      margin: const EdgeInsets.only(top: 30),
                      child: const Text(
                        "Calendar",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 45),
                      alignment: Alignment.center,
                      width: 250,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        "Track your progress",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 350,
                      margin: const EdgeInsets.only(top: 45),
                      child: const Text(
                        'details >>',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}
