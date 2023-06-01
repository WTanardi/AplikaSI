import 'package:flutter/material.dart';

import 'about.dart';

class ToDoDetail extends StatefulWidget {
  const ToDoDetail({super.key});

  @override
  State<ToDoDetail> createState() => _ToDoDetailState();
}

class _ToDoDetailState extends State<ToDoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFACCFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF241F7B),
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
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "To do List",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ToDoItem(),
            SizedBox(
              height: 10,
            ),
            ToDoItem(),
            SizedBox(
              height: 10,
            ),
            ToDoItem(),
          ],
        ),
      ),
    );
  }
}

class ToDoItem extends StatelessWidget {
  const ToDoItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.cancel_outlined,
          size: 35,
          color: Color.fromARGB(255, 242, 25, 9),
        ),
        SizedBox(
          width: 8,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 60,
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
                      "Tugas 2",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      "13/02",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sistem Enterprise - I2",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      "12:00",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
