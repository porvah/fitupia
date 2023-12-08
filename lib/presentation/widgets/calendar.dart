import 'package:first_app/logic/read_user_cubit/read_user_cubit.dart';
import 'package:first_app/logic/registration_cubit/registration_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  String _today = '';
  bool _openMenu = false;
  void toggleOpenMenu() {
    _openMenu = _openMenu ? false : true;
  }

  late List<int> _schedule;

  final List<String> _days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  final List<String> _exercises = [
    "Chest Day",
    "Abs Day",
    "Arm Day",
    "Back Day",
    "Leg Day"
  ];

  @override
  void initState() {
    super.initState();

    var userCubit = BlocProvider.of<ReadUserCubit>(context);
    userCubit.getUser();
    _schedule = userCubit.userData!.exerciseSchedule;

    if (!_schedule.contains(0)) {
      _updateToday();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_schedule);
    return Column(
      children: [
        _buildTimeStamp(),
        Column(
          children: [
            Container(
              color: const Color(0xFFc1121f),
              width: SizeConfig.screenWidth,
              padding:
                  EdgeInsets.all(SizeConfig.getProportionateScreenHeight(20)),
              child: Row(
                children: [
                  _buildTodayExercise(),
                  _buildButton(context),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: _openMenu ? 300 : 0,
              child: _buildDropDown(),
            )
          ],
        )
      ],
    );
  }

  Expanded _buildTodayExercise() {
    return Expanded(
      flex: 2,
      child: Container(
        margin:
            EdgeInsets.only(left: SizeConfig.getProportionateScreenWidth(30)),
        child: Text(
          "TODAY: $_today",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  SizedBox _buildTimeStamp() {
    return SizedBox(
      height: SizeConfig.getProportionateScreenHeight(100),
      child: SfCalendar(
        view: CalendarView.week,
        showCurrentTimeIndicator: false,
        timeSlotViewSettings: const TimeSlotViewSettings(
          timeInterval: Duration(hours: 24),
          timeRulerSize: 0,
          timeIntervalHeight: 0,
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: FloatingActionButton(
        onPressed: _changeSchedule,
        child: _openMenu ? const Icon(Icons.check) : const Icon(Icons.edit),
      ),
    );
  }

  Future<void> _changeSchedule() async {
    if (_openMenu && _checkSchedule(_schedule)) {
      await _updateUserSchedule();
    }

    setState(() {
      if (_openMenu) {
        if (_checkSchedule(_schedule)) {
          _updateToday();
          toggleOpenMenu();
        } else {
          _buildAlertDialog(context);
        }
      } else {
        toggleOpenMenu();
      }
    });
  }

  Future<dynamic> _buildAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Warning!"),
        content: const Text(
          "Please Enter Your Schedule Correctly",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "ok",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

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
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(
                      left: SizeConfig.getProportionateScreenWidth(20)),
                  child: Text(
                    _exercises[index],
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    right: SizeConfig.getProportionateScreenWidth(20)),
                child: DropdownMenu(
                    dropdownMenuEntries: _buildDropDownEntries(),
                    initialSelection:
                        (_schedule[index] != 0) ? _schedule[index] : null,
                    onSelected: (value) {
                      _schedule[index] = value;
                    }),
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
      entries.add(DropdownMenuEntry(value: i + 1, label: _days[i]));
    }
    return entries;
  }

  bool _checkSchedule(List<int> schedule) {
    List<int> unique = [];
    for (int element in schedule) {
      if (!unique.contains(element)) {
        unique.add(element);
      }
    }
    return (unique.length == schedule.length && !schedule.contains(0));
  }

  void _updateToday() {
    int todayWeekday = DateTime.now().weekday;
    if (_schedule.contains(todayWeekday)) {
      _today = _exercises[_schedule.indexOf(todayWeekday)];
    } else {
      _today = 'Free Day';
    }
  }

  Future<void> _updateUserSchedule() async {
    RegistrationCubit regCubit = BlocProvider.of<RegistrationCubit>(context);
    ReadUserCubit userCubit = BlocProvider.of<ReadUserCubit>(context);
    var userData = userCubit.userData!;

    userData.copyWith(exerciseSchedule: _schedule);
    await regCubit.editUser(userData);
    userCubit.getUser();
  }
}
