import 'package:flutter/material.dart';
import 'package:signin_signup/signup3.dart';

class SignUp2 extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String firstName, lastName;
  SignUp2({required this.firstName, required this.lastName});

  final _age = new TextEditingController();
  final _height = new TextEditingController();
  final _weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/images/border2.png",
              height: MediaQuery.of(context).size.height * 0.42,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 30),
                  child: Text(
                    "Enter your body parameters",
                    style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'KoHo',
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Form(
                  child: Padding(
                    key: _formKey,
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.1),
                      child: TextFormField(
                        controller: _age,
                        decoration: InputDecoration(
                          hintText: "Enter your Age in Years",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontFamily: 'KoHo',
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  MediaQuery.of(context).size.width * 0.1),
                            ),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  MediaQuery.of(context).size.width * 0.1),
                            ),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 236, 229, 153),
                              width: MediaQuery.of(context).size.width * 0.008,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.1),
                    child: TextFormField(
                      controller: _height,
                      decoration: InputDecoration(
                        hintText: "Enter your heighet in CMs",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'KoHo',
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                                MediaQuery.of(context).size.width * 0.1),
                          ),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                                MediaQuery.of(context).size.width * 0.1),
                          ),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 236, 229, 153),
                            width: MediaQuery.of(context).size.width * 0.008,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Material(
                    elevation: 10,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.1),
                    child: TextFormField(
                      controller: _weight,
                      decoration: InputDecoration(
                        hintText: "Enter your Weight in KGs",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'KoHo',
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                                MediaQuery.of(context).size.width * 0.1),
                          ),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                                MediaQuery.of(context).size.width * 0.1),
                          ),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 236, 229, 153),
                            width: MediaQuery.of(context).size.width * 0.008,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Next",
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
                                Colors.white,
                                Color.fromARGB(255, 236, 229, 153),
                                Color.fromARGB(255, 80, 150, 200),
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
                              if ((!_age.text.isEmpty &&
                                      !_height.text.isEmpty &&
                                      !_weight.text.isEmpty) &&
                                  (int.parse(_age.text) > 9 &&
                                      int.parse(_age.text) < 100) &&
                                  (int.parse(_height.text) >= 120 &&
                                      int.parse(_height.text) <= 230) &&
                                  (int.parse(_weight.text) >= 30 &&
                                      int.parse(_age.text) <= 300)) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUp3(),
                                  ),
                                );
                              } else if (_age.text.isEmpty ||
                                  _height.text.isEmpty ||
                                  _weight.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 0,
                                    backgroundColor:
                                        Colors.white.withOpacity(0),
                                    content: Container(
                                      padding: EdgeInsets.all(16),
                                      height: 60,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 188, 37, 26),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: const Text(
                                        "These fields cannot be empty",
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
                                //check for age validation
                              } else if (!(int.parse(_age.text) > 9 &&
                                  int.parse(_age.text) < 100)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 0,
                                    backgroundColor:
                                        Colors.white.withOpacity(0),
                                    content: Container(
                                      padding: EdgeInsets.all(16),
                                      height: 90,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 188, 37, 26),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Row(children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            "assets/images/age-group.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.008,
                                        ),
                                        const Text(
                                          "Age must be more than 19 years \nand less than 100 years",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: "KoHo",
                                              color: Colors.white),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ]),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                                //check for height validation
                              } else if (!(int.parse(_height.text) >= 120 &&
                                  int.parse(_height.text) <= 230)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 0,
                                    backgroundColor:
                                        Colors.white.withOpacity(0),
                                    content: Container(
                                      padding: EdgeInsets.all(16),
                                      height: 90,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 82, 244, 37),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Row(children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            "assets/images/height.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.008,
                                        ),
                                        const Text(
                                          "Height must be more than 119 CM \nand less than 231 CM",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "KoHo",
                                              color: Colors.white),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ]),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              } else if (!(int.parse(_weight.text) > 9 &&
                                  int.parse(_weight.text) < 100)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 0,
                                    backgroundColor:
                                        Colors.white.withOpacity(0),
                                    content: Container(
                                      padding: EdgeInsets.all(16),
                                      height: 90,
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 246, 239, 31),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Row(children: [
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Image.asset(
                                            "assets/images/weight-scale.png",
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                          ),
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.008,
                                        ),
                                        const Text(
                                          "Weight must be more than 30 KGs \nand less than 301 KGs",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "KoHo",
                                              color: Colors.white),
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                        ),
                                      ]),
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            },
                            icon: Icon(Icons.navigate_next_rounded),
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
