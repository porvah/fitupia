import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:first_app/presentation/screens/home_screen.dart';
import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:first_app/presentation/widgets/custom_button.dart';
import 'package:first_app/presentation/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/read_user_cubit/read_user_cubit.dart';
import '../../logic/registration_cubit/registration_cubit.dart';
import '../widgets/show_snack_bar_context.dart';
import '../widgets/show_snack_bar_messenger.dart';

class SignUp3Screen extends StatefulWidget {
  static const String routeName = '/signup3_screen';

  const SignUp3Screen({super.key});

  @override
  State<SignUp3Screen> createState() => _SignUp1ScreenState();
}

class _SignUp1ScreenState extends State<SignUp3Screen> {
  final _goalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: SizeConfig.screenWidth * .15),
                  Text(
                    'What\'s your Goal?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: SizeConfig.getProportionateScreenWidth(28),
                      color: const Color.fromARGB(255, 2, 106, 154),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenWidth * .2),
                  _buildTopImages(),
                  _buildContent(),
                  SizedBox(height: SizeConfig.screenWidth * .15),
                  _buildSubmitButton(),
                  const CustomIndicator(size: 3),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                "assets/images_reg/screen30.png",
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
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
    );
  }

  Widget _buildTopImages() {
    return Row(
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
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<RegistrationCubit, RegistrationState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            title: 'Register',
            backgroundColor: const Color.fromARGB(255, 2, 106, 154),
            color: Colors.white,
            icon: Icons.login,
            fontSize: SizeConfig.getProportionateScreenWidth(18),
            loading: state is RegistrationLoading,
            onPressed: () async => await _registerUser(),
          ),
        );
      },
    );
  }

  Future<void> _registerUser() async {
    if (_checkInput()) {
      var nav = Navigator.of(context);
      var scaf = ScaffoldMessenger.of(context);
      var regCubit = BlocProvider.of<RegistrationCubit>(context);

      final currentData = regCubit.curUser;
      currentData.copyWith(
        goal: _goalController.text,
      );

      ReadUserCubit userCubit = BlocProvider.of<ReadUserCubit>(context);
      regCubit.updateUserDate(currentData);
      await regCubit.registerUser();
      userCubit.getUser();

      if (regCubit.state is RegistrationSuccess) {
        showSnackBarMessenger(scaf, 'Registered Successfully', Colors.green);
        nav.pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
      } else if (regCubit.state is RegistrationFailure) {
        showSnackBarMessenger(scaf, 'An error occurred', Colors.red[700]!);
      }
    }
  }

  bool _checkInput() {
    List<List<String?>?> checks = [_checkGoal()];

    for (var check in checks) {
      if (check == null) continue;

      showSnackBarContext(
        context,
        check[0]!,
        const Color.fromARGB(255, 188, 37, 26),
        imgPath: check[1],
      );
      return false;
    }

    return true;
  }

  List<String?>? _checkGoal() {
    String gender = _goalController.text;
    if (gender == 'Lose Weight' || gender == 'Gain Muscles') {
      return null;
    }
    return ["You must select your goal", null];
  }
}
