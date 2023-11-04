import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../size_config/size_config.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});
  static CalendarState? of(BuildContext context) =>
      context.findAncestorStateOfType<CalendarState>();
  @override
  State<Calendar> createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  String today = '-';
  bool _openMenu = false;
  void toggleOpenMenu() {
    _openMenu = _openMenu ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          height: SizeConfig.getProportionateScreenHeight(100),
          child: SfCalendar(
            view: CalendarView.week,
            showCurrentTimeIndicator: false,
            timeSlotViewSettings: const TimeSlotViewSettings(
                timeInterval: Duration(hours: 24),
                timeRulerSize: 0,
                timeIntervalHeight: 0),
          ),
        ),
        Container(
          child: Column(
            children: [
              Container(
                color: const Color(0xFFc1121f),
                width: SizeConfig.screenWidth,
                padding:
                    EdgeInsets.all(SizeConfig.getProportionateScreenHeight(20)),
                child: Container(
                  width: SizeConfig.screenWidth,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.getProportionateScreenWidth(30)),
                        child: Text(
                          "TODAY: $today Day",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.getProportionateScreenWidth(100)),
                        alignment: Alignment.centerRight,
                        child: FloatingActionButton(
                          child: const Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              toggleOpenMenu();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Text(_openMenu ? "open" : "closed"),
              )
            ],
          ),
        )
      ],
    ));
  }
}
