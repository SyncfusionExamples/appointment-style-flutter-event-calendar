import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(AppointmentTextStyle());

class AppointmentTextStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SfCalendar(
            view: CalendarView.day,
            dataSource: _getCalendarDataSource(),
            appointmentTextStyle: TextStyle(
                fontSize: 25,
                color: Color(0xFF045762),
                letterSpacing: 5,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),

        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.pink,
    ));

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
