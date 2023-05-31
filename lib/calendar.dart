import 'package:aplika_si/Model/Event.dart';
import 'package:aplika_si/Model/ToDo.dart';
import 'package:aplika_si/home_page.dart';
import 'package:aplika_si/news.dart';
import 'package:aplika_si/provider/Events.dart';
import 'package:aplika_si/provider/ToDoList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({
    super.key,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
  final List<DateTime> toHighlight = [];
  final Map<DateTime, List<dynamic>> marks = {};
}

class _CalendarPageState extends State<CalendarPage> {
  var currentDate = DateTime.now();
  // var selectedDay = DateTime.now();
  @override
  void didChangeDependencies() {
    initEventlist();
    initDatelist();
    super.didChangeDependencies();
  }

  void initEventlist() {
    var events =
        Provider.of<Events>(context, listen: true).events.values.toList();
    for (Event event in events) {
      if (!widget.toHighlight.contains(event.date) &&
          event.date.compareTo(DateTime.now()) == 1) {
        widget.marks.putIfAbsent(event.date, () => [event]);
        widget.toHighlight.add(event.date);
      }
    }
  }

  void initDatelist() {
    var todos =
        Provider.of<ToDoModel>(context, listen: true).list.values.toList();
    for (Todo todo in todos) {
      if (!widget.toHighlight.contains(todo.date) &&
          todo.date.compareTo(DateTime.now()) == 1) {
        widget.marks.putIfAbsent(todo.date, () => [todo]);
        widget.toHighlight.add(todo.date);
      }
    }
  }

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 32, 17, 0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              months[DateTime.now().month - 1],
              style: const TextStyle(
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
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  currentDate = selectedDay;
                });
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  for (DateTime d in widget.toHighlight) {
                    if (day.day == d.day &&
                        day.month == d.month &&
                        day.year == d.year) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 45,
                            height: 45,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 51, 44, 189),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                )),
                            child: Center(
                                child: Text('${day.day}',
                                    style:
                                        const TextStyle(color: Colors.white))),
                          ),
                        ],
                      );
                    }
                  }
                  return null;
                },
              )),
          Text('Date : $currentDate'),
          Flexible(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Text('index ${index + 1}');
              },
            ),
          )
        ],
      ),
    );
  }
}
