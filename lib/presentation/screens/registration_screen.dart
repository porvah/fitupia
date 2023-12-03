import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:first_app/presentation/screens/profile_screen.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/custom_date_field.dart';
import 'package:first_app/presentation/widgets/label_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../logic/registration_cubit/registration_cubit.dart';
import '../size_config/size_config.dart';
import '../widgets/custom_button.dart';
import '../widgets/show_snack_bar.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = '/registration_screen';

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late RegistrationCubit regCubit;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _goalController;
  late String _date;
  final DateFormat _dateFormat = DateFormat.yMd();

  @override
  void initState() {
    super.initState();

    regCubit = BlocProvider.of<RegistrationCubit>(context);
    _heightController = TextEditingController(
      text: regCubit.curUser.height.toString(),
    );
    _weightController = TextEditingController(
      text: regCubit.curUser.weight.toString(),
    );
    _goalController = TextEditingController(
      text: regCubit.curUser.goal,
    );
    _date = regCubit.curUser.dateOfBirth;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        '',
        Colors.white,
        const Color.fromARGB(255, 2, 106, 154),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              height: SizeConfig.screenWidth * .3,
              child: Image.asset(
                'assets/logo2.png',
                width: SizeConfig.screenWidth * .1,
              ),
            ),
            Text(
              'Edit your information',
              style: TextStyle(
                color: const Color.fromARGB(255, 2, 106, 154),
                fontSize: SizeConfig.getProportionateScreenWidth(20),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            CustomDateField(
              onTap: _changeData,
              date: _date,
            ),
            _buildHeightWeight(),
            _buildGoal(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                title: 'Save',
                backgroundColor: const Color.fromARGB(255, 2, 106, 154),
                icon: Icons.save,
                color: Colors.white,
                fontSize: SizeConfig.getProportionateScreenWidth(20),
                onPressed: _updateUser,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildHeightWeight() {
    return Row(
      children: [
        Expanded(
          child: LabelInputField(
            title: 'Height',
            hintText: 'Enter your height in CM',
            textEditingController: _heightController,
            textInputType: TextInputType.number,
            icon: const Icon(Icons.height),
          ),
        ),
        Expanded(
          child: LabelInputField(
            title: 'Weight',
            hintText: 'Enter your Weight in KG',
            textEditingController: _weightController,
            textInputType: TextInputType.number,
            icon: const Icon(Icons.monitor_weight_outlined),
          ),
        ),
      ],
    );
  }

  Column _buildGoal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getTitle(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomDropdown(
            hintText: "Select your Goal",
            items: const ['Lose Weight', 'Gain Muscles'],
            borderSide: const BorderSide(
              width: 2,
              color: Color.fromARGB(255, 2, 106, 154),
            ),
            borderRadius: BorderRadius.circular(10.0),
            hintStyle: TextStyle(color: Colors.grey[600]),
            fieldSuffixIcon: const Icon(
              Icons.track_changes_outlined,
              size: 25,
            ),
            controller: _goalController,
          ),
        ),
      ],
    );
  }

  Widget _getTitle() {
    return const Padding(
      padding: EdgeInsets.only(left: 8.0, top: 8.0),
      child: Text(
        'Goal',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color.fromARGB(255, 2, 106, 154),
        ),
      ),
    );
  }

  void _changeData(DateTime value) {
    setState(() {
      _date = _dateFormat.format(value);
    });
  }

  Future<void> _updateUser() async {
    if (_checkInput() == false) {
      return;
    }

    final currentData = regCubit.curUser;
    currentData.copyWith(
      dateOfBirth: _date,
      goal: _goalController.text,
      height: double.tryParse(_heightController.text),
      weight: double.tryParse(_weightController.text),
    );

    var nav = Navigator.of(context);
    await regCubit.editUser(currentData);

    nav.pop();
    nav.pop();
    nav.pushNamed(ProfileScreen.routeName);
  }

  bool _checkInput() {
    List<List<String?>?> checks = [
      _checkHeight(),
      _checkWeight(),
    ];

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

  List<String?>? _checkHeight() {
    if (_heightController.text.isEmpty) {
      return ["Height can't be empty", null];
    }

    double? height = double.tryParse(_heightController.text);
    if (height == null) {
      return ["Invalid Height", null];
    } else if (height < 120 || height > 230) {
      return [
        "Height must be between 120 and 230",
        "assets/images_reg/height.png"
      ];
    }
    return null;
  }

  List<String?>? _checkWeight() {
    if (_weightController.text.isEmpty) {
      return ["Weight can't be empty", null];
    }

    double? weight = double.tryParse(_weightController.text);
    if (weight == null) {
      return ["Invalid Weight", null];
    } else if (weight < 30 || weight > 300) {
      return [
        "Weight must be between 30 and 300",
        "assets/images_reg/weight-scale.png"
      ];
    }
    return null;
  }
}
