import 'package:first_app/logic/registration_cubit/registration_cubit.dart';
import 'package:first_app/presentation/screens/welcome_screen.dart';
import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:first_app/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/profile_image_cubit/profile_image_cubit.dart';
import '../../logic/read_meal_cubit/read_meal_cubit.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings_screen';

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        'Settings',
        Colors.white,
        const Color.fromARGB(255, 7, 53, 74),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: SizeConfig.screenWidth,
          height: SizeConfig.getProportionateScreenHeight(80),
          child: CustomButton(
            title: 'Delete Account',
            backgroundColor: Colors.red[700],
            color: Colors.white,
            fontSize: SizeConfig.getProportionateScreenWidth(20),
            icon: Icons.delete_forever,
            onPressed: () => _onPressed(context),
          ),
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    showDialog(context: context, builder: (ctx) => _buildDialog(ctx));
  }

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Are you sure?',
        style: TextStyle(fontSize: 22, color: Colors.red),
      ),
      content: const Text(
        'All your data will be deleted forever!',
        style: TextStyle(fontSize: 18),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () async => await _deleteAccount(context),
          child: Text('Delete', style: TextStyle(color: Colors.red[700])),
        ),
      ],
    );
  }

  Future<void> _deleteAccount(BuildContext context) async {
    var nav = Navigator.of(context);

    var regCubit = BlocProvider.of<RegistrationCubit>(context);
    var imgCubit = BlocProvider.of<ProfileImageCubit>(context);
    var mealCubit = BlocProvider.of<ReadMealCubit>(context);

    await imgCubit.deleteProfileImage(regCubit.curUser);
    await regCubit.deleteUser();
    await mealCubit.clearMeals();

    nav.pushNamedAndRemoveUntil(
      WelcomeScreen.routeName,
      (route) => false,
    );
  }
}
