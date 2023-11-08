import 'package:flutter/material.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'signup2.dart';

class SignUp1 extends StatelessWidget {
  SignUp1({super.key});

  final _formfield = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _Genctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/images_reg/Firefly_greek_architecture_temple_9509999.png",
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 0, right: 30),
                  child: Text(
                    "Enter your name",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'KoHo',
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Form(
                  key: _formfield,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.1),
                          child: TextFormField(
                            controller: _firstName,
                            decoration: InputDecoration(
                              hintText: "First name",
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
                                  color: const Color.fromARGB(255, 236, 229, 153),
                                  width:
                                      MediaQuery.of(context).size.width * 0.008,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.1),
                          child: TextFormField(
                            controller: _lastName,
                            decoration: InputDecoration(
                              hintText: "Last name",
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
                                  color:
                                      const Color.fromARGB(255, 236, 229, 153),
                                  width:
                                      MediaQuery.of(context).size.width * 0.008,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.1),
                          child: CustomDropdown(
                            hintText: "Select your Gender",
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontFamily: 'KoHo',
                            ),
                            items: const ['Male', 'Female'],
                            controller: _Genctrl,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: IconButton(
                                  onPressed: () {
                                    if (!(_firstName.text.isEmpty ||
                                            _lastName.text.isEmpty) &&
                                        ((RegExp(r'^[a-zA-Z]+$')
                                                .hasMatch(_firstName.text) &&
                                            RegExp(r'^[a-zA-Z]+$')
                                                .hasMatch(_lastName.text))) &&
                                        !((_firstName.text.length < 2 ||
                                                _firstName.text.length > 20) ||
                                            (_lastName.text.length < 2 ||
                                                _lastName.text.length > 20)) &&
                                        !(_Genctrl.text.isEmpty)) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SignUp2(
                                              firstName: _firstName.text,
                                              lastName: _lastName.text),
                                        ),
                                      );
                                    } else if ((_firstName.text.isEmpty ||
                                        _lastName.text.isEmpty)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          elevation: 0,
                                          backgroundColor:
                                              Colors.white.withOpacity(0),
                                          content: Container(
                                            padding: const EdgeInsets.all(16),
                                            height: 60,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 188, 37, 26),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: const Text(
                                              "Name Fields cannot be empty",
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

                                    //check for valid characters
                                    else if (!RegExp(r'^[a-zA-Z]+$')
                                            .hasMatch(_firstName.text) ||
                                        !RegExp(r'^[a-zA-Z]+$')
                                            .hasMatch(_lastName.text)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          elevation: 0,
                                          backgroundColor:
                                              Colors.white.withOpacity(0),
                                          content: Container(
                                            padding: const EdgeInsets.all(16),
                                            height: 78,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 82, 244, 37),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Row(children: [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Image.asset(
                                                  "assets/images_reg/letters.png",
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.2,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              const Text(
                                                "Names can contain only \nEnglish letters",
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
                                    }

                                    //check for valid name length
                                    else if ((_firstName.text.length < 2 ||
                                            _firstName.text.length > 20) ||
                                        (_lastName.text.length < 2 ||
                                            _lastName.text.length > 20)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          elevation: 0,
                                          backgroundColor:
                                              Colors.white.withOpacity(0),
                                          content: Container(
                                            padding: const EdgeInsets.all(16),
                                            height: 90,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 188, 37, 26),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: const Text(
                                              "Name must be more than 2 characters and less than 20 characters",
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
                                    } else if ((_Genctrl.text.isEmpty)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          elevation: 0,
                                          backgroundColor:
                                              Colors.white.withOpacity(0),
                                          content: Container(
                                            padding: const EdgeInsets.all(16),
                                            height: 60,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 82, 244, 37),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Row(children: [
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Image.asset(
                                                  "assets/images_reg/sex.png",
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.4,
                                                ),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              const Text(
                                                "You must select your gender",
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
                                    }
                                  },
                                  icon: const Icon(Icons.navigate_next_rounded),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
