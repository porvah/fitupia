import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:first_app/logic/registration_cubit/registration_cubit.dart';
import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:first_app/presentation/widgets/custom_button.dart';
import 'package:first_app/presentation/widgets/custom_date_field.dart';
import 'package:first_app/presentation/widgets/custom_indicator.dart';
import 'package:first_app/presentation/widgets/show_snack_bar.dart';
import 'package:first_app/presentation/widgets/welcome_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../widgets/label_input_field.dart';
import 'signup2_screen.dart';

class SignUp1Screen extends StatefulWidget {
  static const String routeName = '/signup1_screen';

  const SignUp1Screen({super.key});

  @override
  State<SignUp1Screen> createState() => _SignUp1ScreenState();
}

class _SignUp1ScreenState extends State<SignUp1Screen> {
  final _nameController = TextEditingController();
  final _genderController = TextEditingController();
  final DateFormat _dateFormat = DateFormat.yMd();
  String? _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const WelcomeMessage(),
            LabelInputField(
              title: 'Name',
              hintText: 'Enter your name',
              textEditingController: _nameController,
              icon: const Icon(Icons.person),
            ),
            CustomDateField(onTap: _selectDate, date: _date),
            _buildGender(),
            _buildSubmitButton(),
            const CustomIndicator(size: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomButton(
        title: 'Next',
        backgroundColor: const Color.fromARGB(255, 2, 106, 154),
        color: Colors.white,
        icon: Icons.arrow_forward_ios_outlined,
        fontSize: SizeConfig.getProportionateScreenWidth(18),
        onPressed: () {
          if (_checkInput()) {
            var regCubit = BlocProvider.of<RegistrationCubit>(context);
            final currentData = regCubit.curUser;

            regCubit.updateUserDate(currentData.copyWith(
              name: _nameController.text,
              dateOfBirth: _date,
              gender: _genderController.text,
            ));

            Navigator.of(context).pushNamed(SignUp2Screen.routeName);
          }
        },
      ),
    );
  }

  Widget _buildGender() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Gender',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromARGB(255, 2, 106, 154),
              ),
            ),
          ),
          CustomDropdown(
            hintText: "Select your Gender",
            items: const ['Male', 'Female'],
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromARGB(255, 2, 106, 154),
            ),
            borderRadius: BorderRadius.circular(10.0),
            hintStyle: TextStyle(color: Colors.grey[600]),
            fieldSuffixIcon: const Icon(
              Icons.male,
              size: 25,
            ),
            controller: _genderController,
          ),
        ],
      ),
    );
  }

  void _selectDate(DateTime value) {
    setState(() {
      _date = _dateFormat.format(value);
    });
  }

  bool _checkInput() {
    List<List<String?>?> checks = [_checkName(), _checkAge(), _checkGender()];

    for (var check in checks) {
      if (check == null) continue;

      showSnackBar(
        context,
        check[0]!,
        const Color.fromARGB(255, 188, 37, 26),
        imgPath: check[1],
      );
      return false;
    }

    return true;
  }

  List<String?>? _checkAge() {
    if (_date == null) {
      return ["You must choose your age", null];
    }
    return null;
  }

  List<String?>? _checkName() {
    String name = _nameController.text.trim();
    if (name.isEmpty) {
      return ["Name field can't be empty", null];
    } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(name)) {
      return [
        "Name can contain only English letters",
        "assets/images_reg/letters.png"
      ];
    } else if (name.length <= 2) {
      return ["Name is too short", null];
    }
    return null;
  }

  List<String?>? _checkGender() {
    String gender = _genderController.text;
    if (gender == 'Male' || gender == 'Female') {
      return null;
    }
    return ["You must select your gender", "assets/images_reg/sex.png"];
  }
}
