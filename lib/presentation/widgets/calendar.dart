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

  final List<List<String>> _days = [
    ["Saterday", "SA"],
    ["Sunday", "SU"],
    ["Monday", "MO"],
    ["Tuesday", "TU"],
    ["Wednesday", "WE"],
    ["Thursday", "TH"],
    ["Friday", "FR"]
  ];
  final List<List<String>> _exercises = [
    ["Chest Day", ""],
    ["Abs Day", ""],
    ["Arm Day", ""],
    ["Back Day", ""],
    ["Leg Day", ""]
  ];
  ListView _buildDropDown() {
    return ListView.builder(
      itemCount: _exercises.length,
      itemBuilder: (context, index) {
        return Container(
          width: SizeConfig.screenWidth,
          padding:
              EdgeInsets.only(top: SizeConfig.getProportionateScreenHeight(20)),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: SizeConfig.getProportionateScreenWidth(20)),
                child: Text(
                  _exercises[index][0],
                  style: const TextStyle(fontSize: 15),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(
                    left: SizeConfig.getProportionateScreenWidth(100),
                    right: SizeConfig.getProportionateScreenWidth(20)),
                child: DropdownMenu(
                    dropdownMenuEntries: _buildDropDownEntries(),
                    onSelected: (value) => _exercises[index][1] = value),
              ),
            ],
          ),
        );
      },
    );
  }

  List<DropdownMenuEntry> _buildDropDownEntries() {
    List<DropdownMenuEntry> entries = [];
    for (int i = 0; i < _days.length; i++) {
      entries.add(DropdownMenuEntry(value: _days[i][1], label: _days[i][0]));
    }
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
                          child: _openMenu
                              ? const Icon(Icons.check)
                              : const Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              if (_openMenu) {
                                toggleOpenMenu();
                              } else {
                                toggleOpenMenu();
                                today = _exercises[0][1];
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: _openMenu ? 300 : 0,
                  child: _buildDropDown())
            ],
          ),
        )
      ],
    );
  }
}
