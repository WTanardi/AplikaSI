import 'package:aplika_si/Model/Event.dart';
import 'package:aplika_si/provider/Events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({
    super.key,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
  late List<DateTime> toHighlight;
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  void initState() {
    super.initState();
    var events = [];
    // Provider.of<Events>(context, listen: true).events.values.toList();
    for (Event event in events) {
      if (!widget.toHighlight.contains(event.date)) {
        widget.toHighlight.add(event.date);
        print(event.date);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 32, 17, 0),
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
    );
  }
}
