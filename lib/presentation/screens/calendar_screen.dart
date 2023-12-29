import 'package:first_app/presentation/screens/stats_screen.dart';
import 'package:first_app/presentation/widgets/calendar.dart';
import 'package:flutter/material.dart';
import '../size_config/size_config.dart';

class CalendarScreen extends StatelessWidget {
  static const String routeName = '/calendar_screen';
  const CalendarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar"),
        backgroundColor: const Color(0xFFc1121f),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          const Calendar(),
          const Divider(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(StatsScreen.routeName);
            },
            child: SizedBox(
              height: SizeConfig.screenHeight * 0.35,
              child: Card(
                elevation: 5,
                shadowColor: Colors.black,
                margin: const EdgeInsets.all(10),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  footer: Container(
                      padding: const EdgeInsets.all(16),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        "Track your progress",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.getProportionateScreenWidth(22),
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )),
                  child: Image.asset(
                    'assets/images/statistics.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
