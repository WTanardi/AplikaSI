import 'package:aplika_si/Model/ToDo.dart';
import 'package:aplika_si/provider/ToDoList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'profil.dart';
import 'news.dart';
import 'calendar.dart';
import 'about.dart';
import 'main.dart';

class AplikaSI extends StatefulWidget {
  const AplikaSI({super.key});

  @override
  State<AplikaSI> createState() => _AplikaSIState();
}

class _AplikaSIState extends State<AplikaSI> {
  late int index;

  List showBottomNavBarItem = [
    const HomePage(),
    const CalendarPage(),
    const News(),
    Profil()
  ];

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFACCFFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFF241F7B),
          leading: const Icon(
            Icons.menu,
            size: 35,
          ),
          title: Center(
            child: Image.asset(
              "assets/images/logo.png",
              width: 42,
              fit: BoxFit.fitWidth,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutUs(),
                  ),
                );
              },
              icon: const Icon(
                Icons.question_mark_outlined,
                size: 35,
              ),
            ),
            const SizedBox(
              width: 15,
            )
          ],
        ),
        body: showBottomNavBarItem[index],
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF241F7B),
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF241F7B),
              icon: Icon(
                Icons.date_range_outlined,
                size: 35,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF241F7B),
              icon: Icon(
                Icons.newspaper_outlined,
                size: 35,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF241F7B),
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _titleController = TextEditingController();
  final _courseController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime? deadlineDate;
  TimeOfDay? deadlineHour;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Hi, William",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Welcome back",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Color(0XFF241F7B),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
            width: double.infinity,
            color: const Color(0XFF7CAEF3),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            "Upcoming Classes",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Text(
                            "VIEW MORE",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200,
                              fontFamily: 'Poppins',
                              color: Color(0xFF241F7B),
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      SizedBox(
                        width: 13,
                      ),
                      Classes(),
                      SizedBox(
                        width: 15,
                      ),
                      Classes(),
                      SizedBox(
                        width: 15,
                      ),
                      Classes(),
                      SizedBox(
                        width: 13,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Color(0xFF7CAEF3),
            ),
            margin: const EdgeInsets.all(15),
            height: 111,
            child: Row(
              children: [
                Container(
                  width: 200,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/images/HomeBackground.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: const [
                          Text(
                            "POINTER 2023",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF241F7B),
                            ),
                          ),
                          Text(
                            "Staff",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF241F7B),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Open",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF241F7B),
                            ),
                          ),
                          Text(
                            "Recruitment",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF241F7B),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            width: double.infinity,
            color: const Color(0xFF7CAEF3),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "To-do list",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins'),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            insetPadding:
                                const EdgeInsets.only(top: 80, bottom: 80),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustTextField(
                                      hintText: 'Tugas',
                                      prefixIcon: const Icon(Icons.task),
                                      isObscure: false,
                                      controller: _titleController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'This field cannot be empty';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    CustTextField(
                                      hintText: 'Mata Kuliah',
                                      prefixIcon: const Icon(Icons.book),
                                      isObscure: false,
                                      controller: _courseController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'This fiels cannot be empty';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    CustButton(
                                      buttonText: (deadlineHour == null ||
                                              deadlineDate == null)
                                          ? 'Please select deadline'
                                          : '${DateFormat('dd-MM-yyyy').format(deadlineDate!)} / ${deadlineHour!.format(context)}',
                                      onPressed: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.utc(
                                            DateTime.now().year,
                                            DateTime.now().month + 1,
                                            1,
                                          ),
                                        )
                                            .then((date) {
                                              if (date == null) return;
                                              setState(() {
                                                deadlineDate = date;
                                              });
                                            })
                                            .then(
                                              (value) => showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ),
                                            )
                                            .then(
                                              (time) {
                                                if (time == null) return;
                                                setState(() {
                                                  deadlineHour = time;
                                                });
                                              },
                                            );
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    CustButton(
                                      buttonText: 'Submit',
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          Provider.of<ToDoModel>(context,
                                                  listen: false)
                                              .addToDo(
                                            '${deadlineDate!.month}m${deadlineHour!.hour}h${deadlineHour!.minute}ms',
                                            Todo(
                                                task: _titleController.text
                                                    .toString(),
                                                course: _courseController.text
                                                    .toString(),
                                                deadlineDate: deadlineDate!,
                                                deadlineHour: deadlineHour!),
                                          );
                                          Navigator.pop(context);
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 17,
                      ),
                    )
                  ],
                ),
                Consumer<ToDoModel>(
                  builder: (context, todo, child) {
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: (todo.list.isEmpty || todo.list.length < 3)
                              ? todo.list.length
                              : 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                ToDoList(
                                  task: todo.list.values.toList()[index].task,
                                  course:
                                      todo.list.values.toList()[index].course,
                                  deadlineDate: todo.list.values
                                      .toList()[index]
                                      .deadlineDate,
                                  deadlineHour: todo.list.values
                                      .toList()[index]
                                      .deadlineHour,
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
                Column(
                  children: [
                    // const ToDoList(),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const ToDoList(),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const ToDoList(),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    GestureDetector(
                      onTap: () {
                        print(Provider.of<ToDoModel>(context, listen: false)
                            .list
                            .keys);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 25),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          "VIEW MORE",
                          style: TextStyle(
                              color: Color(0xFF241F7B),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                        color: Color(0xFF241F7B),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.date_range_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Class",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Schedule",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                        color: Color(0xFF241F7B),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.school,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Academic",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Bank",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                        color: Color(0xFF241F7B),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.format_align_left_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Form",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                        color: Color(0xFF241F7B),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: 35,
                        ),
                        Text(
                          "Chat",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ToDoList extends StatelessWidget {
  final String task;
  final String course;
  final DateTime deadlineDate;
  final TimeOfDay deadlineHour;

  const ToDoList({
    super.key,
    required this.task,
    required this.course,
    required this.deadlineDate,
    required this.deadlineHour,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(
          Icons.circle,
          size: 25,
          color: Color(0xFF241F7B),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: 305,
          height: 50,
          decoration: const BoxDecoration(
              color: Color(0xFF241F7B),
              borderRadius: BorderRadius.all(Radius.circular(7))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    task,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "${deadlineDate.day}/${deadlineDate.month}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    course,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    deadlineHour.format(context),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins'),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Classes extends StatelessWidget {
  const Classes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF241F7B),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Thursday 09 February",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 8,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "SIC202",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "FST: LKSI-4",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                  width: double.infinity,
                  color: const Color(0xFF000000),
                  height: 0.5,
                ),
                const Text(
                  "08:50 - 10:30",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
