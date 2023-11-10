import 'package:first_app/logic/registration_cubit/registration_cubit.dart';
import 'package:first_app/presentation/size_config/size_config.dart';
import 'package:first_app/presentation/themes/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user_data.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile_screen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final int profileHeight = 120;
  late UserData userData;

  @override
  void initState() {
    super.initState();
    userData = BlocProvider.of<RegistrationCubit>(context).curUser;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> userParams = [
      _buildTile(
        context,
        'Height',
        '${userData.height.toStringAsFixed(1)} CM',
        Icons.height_outlined,
      ),
      _buildTile(
        context,
        'Weight',
        '${userData.weight.toStringAsFixed(1)} KG',
        Icons.monitor_weight_outlined,
      ),
    ];
    final List<Widget> userGoal = [
      _buildTile(
        context,
        'Goal',
        userData.goal,
        Icons.track_changes_outlined,
      ),
    ];
    final List<Widget> userBirth = [
      _buildTile(
        context,
        'Date of Birth',
        userData.dateOfBirth,
        Icons.calendar_today,
      ),
    ];

    return Scaffold(
      appBar: buildAppBar(
        'Profile',
        Colors.white,
        const Color.fromARGB(255, 14, 130, 83),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            _buildTop(context),
            _getUserName(),
            _buildPanner(context, userParams),
            _buildPanner(context, userGoal),
            _buildPanner(context, userBirth),
          ],
        ),
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        _getCoverImage(context),
        _getProfileImage(),
      ],
    );
  }

  Widget _getCoverImage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: profileHeight / 2),
      color: Colors.grey,
      width: SizeConfig.screenWidth,
      height: 150,
      child: Image.asset(
        'assets/images_reg/Firefly_greek_architecture.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget _getProfileImage() {
    return Positioned(
      bottom: 0,
      child: CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade600,
        backgroundImage: const AssetImage('assets/images/personLogo.jpg'),
      ),
    );
  }

  Widget _getUserName() {
    return Text(
      userData.name,
      style: const TextStyle(
        color: Color.fromARGB(255, 14, 130, 83),
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPanner(BuildContext context, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 5, 119, 77),
        borderRadius: BorderRadius.circular(12),
      ),
      width: SizeConfig.screenWidth,
      // height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: children,
      ),
    );
  }

  Widget _buildTile(
      BuildContext context, String title, String content, IconData? icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: SizeConfig.getProportionateScreenWidth(30),
              color: Colors.white,
            ),
            const SizedBox(width: 4),
            Text(
              content,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 99, 235, 145),
                fontSize: 24,
              ),
            ),
          ],
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
