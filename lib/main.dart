import 'package:flutter/material.dart';

void main() {
  runApp(const AplikaSI());
}

class AplikaSI extends StatefulWidget {
  const AplikaSI({super.key});

  @override
  State<AplikaSI> createState() => _AplikaSIState();
}

class _AplikaSIState extends State<AplikaSI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFACCFFF),
        appBar: AppBar(
          backgroundColor: Color(0xFF241F7B),
          leading: Icon(
            Icons.menu,
            size: 35,
          ),
          title: Center(
              child: Container(
            child: Image.asset(
              "assets/images/logo.png",
              width: 42,
              fit: BoxFit.fitWidth,
            ),
          )),
          actions: [
            Icon(
              Icons.notifications,
              size: 35,
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: SingleChildScrollView(
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
                      decoration: BoxDecoration(
                        color: Color(0XFF241F7B),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
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
                padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
                width: double.infinity,
                color: Color(0XFF7CAEF3),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
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
                            children: [
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
                        children: [
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xFF7CAEF3),
                ),
                margin: EdgeInsets.all(15),
                height: 111,
                child: Row(
                  children: [
                    Container(
                      width: 219,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      width: 161,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
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
                            children: [
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
                padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                width: double.infinity,
                color: Color(0xFF7CAEF3),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "To-do list",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Poppins'),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            size: 17,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ToDoList(),
                        SizedBox(
                          height: 10,
                        ),
                        ToDoList(),
                        SizedBox(
                          height: 10,
                        ),
                        ToDoList(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 25),
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "VIEW MORE",
                            style: TextStyle(
                                color: Color(0xFF241F7B),
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                            color: Color(0xFF241F7B),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                        decoration: BoxDecoration(
                            color: Color(0xFF241F7B),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                        decoration: BoxDecoration(
                            color: Color(0xFF241F7B),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                        decoration: BoxDecoration(
                            color: Color(0xFF241F7B),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF241F7B),
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 35,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF241F7B),
              icon: Icon(
                Icons.date_range_outlined,
                color: Colors.white,
                size: 35,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF241F7B),
              icon: Icon(
                Icons.newspaper_outlined,
                color: Colors.white,
                size: 35,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF241F7B),
              icon: Icon(
                Icons.person,
                color: Colors.white,
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

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.circle,
          size: 25,
          color: Color(0xFF241F7B),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: 305,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xFF241F7B),
              borderRadius: BorderRadius.all(Radius.circular(7))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tugas 2",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "13/02",
                    style: TextStyle(
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
                    "Sistem Enterprose - I2",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Poppins'),
                  ),
                  Text(
                    "12:00",
                    style: TextStyle(
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
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF241F7B),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            width: double.infinity,
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            padding: EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "FST: LKSI-4",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                  width: double.infinity,
                  color: Color(0xFF000000),
                  height: 0.5,
                ),
                Text(
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
