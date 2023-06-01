import 'package:aplika_si/Model/Event.dart';
import 'package:aplika_si/Model/ToDo.dart';
import 'package:aplika_si/home_page.dart';
import 'package:aplika_si/news.dart';
import 'package:aplika_si/provider/Events.dart';
import 'package:aplika_si/provider/ToDoList.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({
    super.key,
  });

  @override
  State<CalendarPage> createState() => _CalendarPageState();
  final List<DateTime> toHighlight = [];
  final Map<String, List<dynamic>> marks = {};
}

class _CalendarPageState extends State<CalendarPage> {
  String? currentDate = DateFormat.yMd().format(DateTime.now());
  // var selectedDay = DateTime.now();
  @override
  void didChangeDependencies() {
    widget.marks.clear();
    initEventlist();
    initDatelist();
    super.didChangeDependencies();
  }

  void initEventlist() {
    var events =
        Provider.of<Events>(context, listen: true).events.values.toList();
    var dateKey;
    for (Event event in events) {
      dateKey = DateFormat.yMd().format(event.date);
      if (!widget.toHighlight.contains(dateKey) &&
          event.date.compareTo(DateTime.now()) == 1) {
        widget.marks[dateKey] = [...?widget.marks[dateKey], event];
        widget.toHighlight.add(event.date);
      }
    }
  }

  void initDatelist() {
    var todos =
        Provider.of<ToDoModel>(context, listen: true).list.values.toList();
    var dateKey;
    for (Todo todo in todos) {
      dateKey = DateFormat.yMd().format(todo.date);
      if (!widget.toHighlight.contains(dateKey) &&
          todo.date.compareTo(DateTime.now()) == 1) {
        widget.marks[dateKey] = [...?widget.marks[dateKey], todo];
        widget.toHighlight.add(todo.date);
      }
    }
  }

  void printAll(List<dynamic>? lists) {
    if (lists == null) return;
    for (var list in lists) {
      print(list);
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
  DateTime today = DateTime.now();

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
              pageJumpingEnabled: true,
              calendarFormat: CalendarFormat.month,
              firstDay: DateTime.utc(DateTime.now().year, 1, 1),
              lastDay: DateTime.utc(DateTime.now().year, 12, 31),
              focusedDay: today,
              headerVisible: true,
              selectedDayPredicate: (day) => isSameDay(day, today),
              availableGestures: AvailableGestures.all,
              calendarStyle: CalendarStyle(
                // isTodayHighlighted: true,
                defaultTextStyle: const TextStyle(
                  fontFamily: 'Poppins',
                ),
                // defaultDecoration: BoxDecoration(
                //   shape: BoxShape.rectangle,
                //   borderRadius: BorderRadius.circular(10),
                // ),
              ),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  currentDate = DateFormat.yMd().format(selectedDay);
                  focusedDay = selectedDay;
                  today = selectedDay;
                  // printAll(widget.marks[currentDate]);
                  // print(currentDate);
                });
                // if (selectedDay.month != focusedDay.month) {
                //   // Drag to the focused day
                //   day = selectedDay;
                // }
              },
              onPageChanged: (focusedDay) {
                today = focusedDay;
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
          Flexible(
            child: widget.marks[currentDate] == null
                ? Text('Tidak ada event untuk tanggal $currentDate')
                : ListView.builder(
                    itemCount: widget.marks[currentDate]!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        'date : ${widget.marks[currentDate]![index].date}',
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}
