import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    List<String> months = [
      "January",
      "February",
      "March",
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 32, 17, 0),
      child: Container(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: const Text(
                "March",
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            TableCalendar(
              calendarFormat: CalendarFormat.month,
              firstDay: DateTime.utc(DateTime.now().year, 1, 1),
              lastDay: DateTime.utc(DateTime.now().year, 12, 31),
              focusedDay: DateTime.now(),
              headerVisible: true,
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                defaultTextStyle: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
