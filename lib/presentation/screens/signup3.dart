import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

import 'home_screen.dart';

class SignUp3 extends StatelessWidget {
  final _Goalctrl = TextEditingController();

  SignUp3({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              "assets/images_reg/screen30.png",
              height: MediaQuery.of(context).size.height * 0.25,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 30),
                  child: Text(
                    "What's your goal ",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'KoHo',
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          "assets/images_reg/screen31.png",
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images_reg/screen32.png",
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.1),
                    child: CustomDropdown(
                      hintText: "Select your Goal",
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'KoHo',
                      ),
                      items: const ['Lose Weight', 'Gain Muscles'],
                      controller: _Goalctrl,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Finish",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KoHo',
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.1,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 236, 229, 153),
                                Color.fromARGB(255, 80, 150, 200),
                                Color.fromARGB(255, 145, 145, 145),
                              ], // Define your gradient colors
                              begin: Alignment
                                  .bottomRight, // Define the starting point of the gradient
                              end: Alignment
                                  .topLeft, // Define the ending point of the gradient
                            ),
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.1,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.17,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: IconButton(
                            onPressed: () {
                              if (_Goalctrl.text.isNotEmpty) {
                                //3al Home screen
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx) => const HomeScreen(),
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 0,
                                    backgroundColor:
                                        Colors.white.withOpacity(0),
                                    content: Container(
                                      padding: const EdgeInsets.all(16),
                                      height: 60,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 188, 37, 26),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: const Text(
                                        "You must have a goal",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "KoHo",
                                            color: Colors.white),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            },
                            icon: const Icon(Icons.navigate_next_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
