import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../size_config/size_config.dart';

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class CalendarScreen extends StatefulWidget {
  static const String routeName = '/calendar_screen';

  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("Calendar")),
      body: SafeArea(
          child: Column(
        children: [
          SfCalendar(
            dataSource: _getCalendarDataSource(),
            view: CalendarView.week,
            showDatePickerButton: true,
            showCurrentTimeIndicator: false,
            timeSlotViewSettings: TimeSlotViewSettings(
              timeInterval: const Duration(hours: 24),
              timeIntervalHeight: SizeConfig.getProportionateScreenHeight(150),
              minimumAppointmentDuration: const Duration(hours: 24),
              timeRulerSize: 0,
              numberOfDaysInView: 4,
              timelineAppointmentHeight: 300,
            ),
            firstDayOfWeek: 6,
          ),
        ],
      )),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    //DateTime now = DateTime.now();
    appointments.add(Appointment(
      subject: 'Leg Day',
      color: Colors.cyan,
      recurrenceRule: "FREQ=WEEKLY;INTERVAL=1;BYDAY=WE;UNTIL=22000810",
      startTime: DateTime(2023, 11, 1, 5),
      endTime: DateTime(2023, 11, 1, 23),
    ));
    appointments.add(Appointment(
      subject: 'Abs Day',
      color: Colors.cyan,
      recurrenceRule: "FREQ=WEEKLY;INTERVAL=1;BYDAY=TH;UNTIL=22000810",
      startTime: DateTime(2023, 11, 2, 5),
      endTime: DateTime(2023, 11, 2, 23),
    ));
    appointments.add(Appointment(
      subject: 'Back Day',
      color: Colors.cyan,
      recurrenceRule: "FREQ=WEEKLY;INTERVAL=1;BYDAY=SA;UNTIL=22000810",
      startTime: DateTime(2023, 11, 4, 5),
      endTime: DateTime(2023, 11, 4, 23),
    ));
    appointments.add(Appointment(
      subject: 'Arm Day',
      color: Colors.cyan,
      recurrenceRule: "FREQ=WEEKLY;INTERVAL=1;BYDAY=SU;UNTIL=22000810",
      startTime: DateTime(2023, 11, 5, 5),
      endTime: DateTime(2023, 11, 5, 23),
    ));
    appointments.add(Appointment(
      subject: 'Chest Day',
      color: Colors.cyan,
      recurrenceRule: "FREQ=WEEKLY;INTERVAL=1;BYDAY=SA;UNTIL=22000810",
      startTime: DateTime(2023, 11, 6, 5),
      endTime: DateTime(2023, 11, 6, 23),
    ));

    return _AppointmentDataSource(appointments);
  }
}
