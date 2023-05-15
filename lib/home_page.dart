import 'package:aplika_si/Model/Event.dart';
import 'package:aplika_si/Model/ToDo.dart';
import 'package:aplika_si/Model/User.dart';
import 'package:aplika_si/Service/Auth_Service.dart';
import 'package:aplika_si/Service/Firestore_Service.dart';
import 'package:aplika_si/login.dart';
import 'package:aplika_si/provider/Events.dart';
import 'package:aplika_si/provider/ToDoList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import 'carousel_detail.dart';
import 'profil.dart';
import 'news.dart';
import 'calendar.dart';
import 'about.dart';

final List<List<String>> carouList = [
  [
    "assets/images/HomeBackground.png",
    "POINTER 2023 Staff",
    "Open Recruitment",
  ],
  [
    "assets/images/HomeBackground.png",
    "POINTER 2023 Staff",
    "Open Recruitment",
  ],
  [
    "assets/images/HomeBackground.png",
    "POINTER 2023 Staff",
    "Open Recruitment",
  ],
  [
    "assets/images/HomeBackground.png",
    "POINTER 2023 Staff",
    "Open Recruitment",
  ],
  [
    "assets/images/HomeBackground.png",
    "POINTER 2023 Staff",
    "Open Recruitment",
  ]
];

final List<Widget>? Function(BuildContext) imageSliders =
    (BuildContext context) => carouList.asMap().entries.map(
          (entry) {
            final int index = entry.key;
            final List<String> list = entry.value;
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF7CAEF3),
              ),
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(list),
                      ),
                    );
                  },
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: Container(
                          height: 120,
                          child: Image.asset(list[0], fit: BoxFit.fitHeight),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Center(
                                  child: Text(
                                    list[1],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF241F7B),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                list[2],
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF241F7B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList();

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
  void didChangeDependencies() async {
    Provider.of<Events>(context, listen: false).initData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FireStore.getUser(Auth.getAuthUser()!.email!),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeWidget(snapshot, context);
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(
                color: Color.fromARGB(255, 36, 31, 123),
                semanticsLabel: 'Waiting for data',
              )
            ],
          ),
        );
      },
    );
  }

  SingleChildScrollView HomeWidget(
      AsyncSnapshot<User> snapshot, BuildContext context) {
    double? screenWidth = MediaQuery.of(context).size.width;
    double? screenHeight = MediaQuery.of(context).size.height;
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
                  children: [
                    Text(
                      "Hi, ${snapshot.data!.username}",
                      style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
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
          Event(),
          // Consumer<Events>(
          //   builder: (context, data, child) {
          //     return Row(
          //       children: [
          //         SizedBox(
          //           height: screenHeight * 0.2,
          //           width: screenWidth,
          //           child: ListView.builder(
          //             physics: const AlwaysScrollableScrollPhysics(),
          //             scrollDirection: Axis.horizontal,
          //             shrinkWrap: true,
          //             itemCount: data.events.length,
          //             itemBuilder: (BuildContext context, int index) {
          //               return Column(
          //                 children: [
          //                   Event(
          //                       title: data.events.values.toList()[index].title,
          //                       ),
          //                 ],
          //               );
          //             },
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
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

class Event extends StatefulWidget {
  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  // late final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            items: imageSliders(context),
            carouselController: _controller,
            options: CarouselOptions(
              height: 120,
              autoPlay: true,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: carouList
                .map((list) => list[0])
                .toList()
                .asMap()
                .entries
                .map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 5.0,
                  height: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 13.0, horizontal: 1.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.light
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
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
