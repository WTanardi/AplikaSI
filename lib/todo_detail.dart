import 'package:aplika_si/Model/ToDo.dart';
import 'package:aplika_si/provider/ToDoList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            const SizedBox(
              height: 20,
            ),
            const Text(
              "To do List",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<ToDoModel>(
              builder: (context, todo, child) {
                if (todo.list.isEmpty) {
                  return Container(
                    // width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "There are no to-do",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: todo.list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ToDoItem(
                              todo: todo.list.values.toList()[index],
                              ontap: () {
                                todo.removeToDo(todo.list.keys.toList()[index]);
                                // print(todo.list.keys.toList()[index]);
                              },
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
          ],
        ),
      ),
    );
  }
}

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key, required this.todo, required this.ontap});

  final Todo todo;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: ontap,
          child: const Icon(
            Icons.cancel_outlined,
            size: 35,
            color: Color.fromARGB(255, 242, 25, 9),
          ),
        ),
        const SizedBox(
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
                      todo.task,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      "${todo.date.day}/${todo.date.month}",
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
                      todo.course,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Poppins'),
                    ),
                    Text(
                      '${todo.hour.hour}:${todo.hour.minute}',
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
