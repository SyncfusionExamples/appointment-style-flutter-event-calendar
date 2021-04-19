//import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_calendar/calendar.dart';
//
//void main() => runApp(RecurrenceException());
//
//class RecurrenceException extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//        body: SafeArea(
//          child: SfCalendar(
//            view: CalendarView.week,
//            dataSource: _getCalendarDataSource(),
//          ),
//        ),
//
//        // This trailing comma makes auto-formatting nicer for build methods.
//      ),
//    );
//  }
//
//  _AppointmentDataSource _getCalendarDataSource() {
//    List<Appointment> appointments = <Appointment>[];
//    DateTime exceptionDate = DateTime(2021, 04, 28);
//    appointments.add(Appointment(
//        startTime: DateTime.now(),
//        endTime: DateTime.now().add(Duration(hours: 1)),
//        subject: 'Meeting',
//        color: Colors.pink,
//        recurrenceRule: 'FREQ=DAILY;COUNT=20',
//        recurrenceExceptionDates: <DateTime>[exceptionDate]));
//
//    return _AppointmentDataSource(appointments);
//  }
//}
//
//class _AppointmentDataSource extends CalendarDataSource {
//  _AppointmentDataSource(List<Appointment> source) {
//    appointments = source;
//  }
//}

//import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_calendar/calendar.dart';
//
//void main() {
//  runApp( MyApp());
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//        home: Scaffold(
//          body: MyCalendar(),
//        ));
//  }
//}
//
//class MyCalendar extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return SfCalendar(
//      allowViewNavigation: false,
//      view: CalendarView.month,
//      dataSource: TimeTableDataSource(SAMPLE_DATA),
//      firstDayOfWeek: 1,
//      monthViewSettings: MonthViewSettings(
//        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
//      ),
//    );
//  }
//}
//
//
//final SAMPLE_DATA = [
//  CalendarEntry(
//    eventName: 'Event one',
//    from: DateTime(2021, 04, 12),
//    to: DateTime(2021, 04, 18),
//    background: Colors.blue,
//    isAllDay: true,
//  ),
//  CalendarEntry(
//    eventName: 'Event two',
//    from: DateTime(2021, 04, 19),
//    to: DateTime(2021, 04, 21),
//    background: Colors.green,
//    isAllDay: true,
//  ),
//  CalendarEntry(
//    eventName: 'Event three',
//    from: DateTime.now(),
//    to: DateTime.now(),
//    background: Colors.red,
//    isAllDay: true,
//  ),
//];
//
//class TimeTableDataSource extends CalendarDataSource {
//  TimeTableDataSource(List<CalendarEntry> source) {
//    appointments = source;
//  }
//
//  @override
//  DateTime getStartTime(int index) {
//    return appointments![index].from;
//  }
//
//  @override
//  DateTime getEndTime(int index) {
//    return appointments![index].to;
//  }
//
//  @override
//  String getSubject(int index) {
//    return appointments![index].eventName;
//  }
//
//  @override
//  Color getColor(int index) {
//    return appointments![index].background;
//  }
//
//  @override
//  bool isAllDay(int index) {
//    return appointments![index].isAllDay;
//  }
//}
//
//class CalendarEntry {
//  final String? eventName;
//  final DateTime? from;
//  final DateTime? to;
//  final Color? background;
//  final bool? isAllDay;
//
//  CalendarEntry({
//    @required this.eventName,
//    @required this.from,
//    @required this.to,
//    @required this.background,
//    @required this.isAllDay,
//  });
//
//  CalendarEntry.empty()
//      : this.eventName = '',
//        this.from = null,
//        this.to = null,
//        this.background = null,
//        this.isAllDay = true;
//}

//import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
//void main() => runApp(DatePicker());
//
//class DatePicker extends StatefulWidget {
//  @override
//  _DatePickerState createState() => _DatePickerState();
//}
//
//class _DatePickerState extends State<DatePicker> {
//  DateRangePickerController _controller = DateRangePickerController();
//  bool _selected = false;
//  int _selectedIndex = -1;
//
//  @override
//  Widget build(BuildContext context) {
//    final theme = Theme.of(context);
//    return MaterialApp(
//      home: Scaffold(
//        body: SafeArea(
//          child: SfDateRangePicker(
//            controller: _controller,
//            cellBuilder:
//                (BuildContext context, DateRangePickerCellDetails details) {
//              final now = DateTime.now();
//              final currentDate = DateTime(now.year, now.month, now.day);
//              final isToday
//              = details.date == currentDate;
//              final isPastDay = details.date.isBefore(currentDate);
//              final isSelected = _controller.selectedDate == details.date;
//
//              return Container(
//                margin: EdgeInsets.all(2),
//                child: LayoutBuilder(
//                    builder: (BuildContext context, BoxConstraints constraints) {
//                  double size = constraints.maxWidth;
//                  if (constraints.maxHeight < constraints.maxWidth) {
//                    size = constraints.maxHeight;
//                  }
//                  return Column(
//                    mainAxisSize: MainAxisSize.max,
//                    mainAxisAlignment: MainAxisAlignment.spaceAround,
//                    children: <Widget>[
//                      Container(
//                        alignment: Alignment.center,
//                        width: size,
//                        height: size,
//                        decoration: BoxDecoration(
//                          color: isSelected ? Colors.red : null,
//                          border: isToday
//                              ? Border.all(color: Colors.purple, width: 1)
//                              : null,
//                        ),
//                        child: Text(
//                          details.date.day.toString(),
//                          style: TextStyle(
//                              color: isPastDay
//                                  ? theme.hintColor
//                                  : isSelected
//                                      ? Colors.white
//                                      : Colors.black),
//                        ),
//                      ),
//                    ],
//                  );
//                }),
//              );
//            },
////            selectionShape: DateRangePickerSelectionShape.rectangle,
//            monthViewSettings: DateRangePickerMonthViewSettings(
//              firstDayOfWeek: 1,
//              dayFormat: 'EEE',
//
//            ),
//            showNavigationArrow: true,
//            enablePastDates: false,
//
//          ),
//        ),
//      ),
//    );
//  }
//}

//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
//void main() {
//  return runApp(CalendarTimeline());
//}
//
//class CalendarTimeline extends StatefulWidget {
//  @override
//  BlackoutDates createState() => BlackoutDates();
//}
//
//class BlackoutDates extends State<CalendarTimeline> {
//  DateRangePickerController? _controller = DateRangePickerController();
//  List<String>? _months = <String>[
//    'JANUARY',
//    'FEBRUARY',
//    'MARCH',
//    'APRIL',
//    'MAY',
//    'JUNE',
//    'JULY',
//    'AUGUST',
//    'SEPTEMBER',
//    'OCTOBER',
//    'NOVEMBER',
//    'DECEMBER'
//  ];
//  bool? _selected = false;
//  int? _selectedIndex;
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      home: Scaffold(
//          body: SafeArea(
//        child: Stack(
//          children: [ Container(
//                color: Color(0xFF192841),
//                child: ListView.builder(
//                    shrinkWrap: true,
//                    itemCount: 1,//_months!.length,
//                    scrollDirection: Axis.horizontal,
//                    itemBuilder: (BuildContext context, int index) {
//                      return
//                        GestureDetector(
//                        onTap: () {
//                          setState(() {
//                            _selected = true;
//                            _selectedIndex = index;
//                            _controller!.displayDate =
//                                DateTime(2021, _selectedIndex!, 1, 9, 0, 0);
//                          });
//                        },
//                        child: Card(
//                          margin: const EdgeInsets.fromLTRB(50, 150, 30, 150),
//                          child: SfDateRangePicker(
//                            controller: _controller,
//                            selectionColor: Colors.transparent,
//                            view: DateRangePickerView.month,
//                            cellBuilder: cellBuilder,
//
//                          ),
//                        ),
//                      );
//                    }),
//              ),
//
//          ],
//        ),
//      )),
//    );
//  }
//
//  Widget cellBuilder(BuildContext context, DateRangePickerCellDetails details) {
//    var IsSelected = _controller!.selectedDate != null &&
//        details.date.year == _controller!.selectedDate!.year &&
//        details.date.month == _controller!.selectedDate!.month &&
//        details.date.day == _controller!.selectedDate!.day;
//    if (IsSelected) {
//      return Column(
//        children: [
//          Container(
//            width: 50,
//            height: 40,
//            decoration:
//                BoxDecoration(shape: BoxShape.rectangle, color: Colors.red),
//            child: Text(
//              details.date.day.toString(),
//              textAlign: TextAlign.center,
//              style: TextStyle(color: Colors.white),
//            ),
//          ),
//        ],
//      );
//    } else {
//      return Container(
//        child: Text(
//          details.date.day.toString(),
//          textAlign: TextAlign.center,
//          style: TextStyle(color: Colors.black),
//        ),
//      );
//    }
//  }
//}

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
