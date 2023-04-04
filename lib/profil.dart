import 'package:aplika_si/controller/AuthController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  Profil({super.key}) {
    email = currentUser!.email!;
  }

  User? currentUser = Auth.GetAuthUser();
  String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0XFF241F7B),
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 104.7,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "William Tanardi",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins'),
            ),
            const Text(
              "082111633021",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins'),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              padding: const EdgeInsets.all(17),
              color: const Color(0xFF7CAEF3),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.email,
                        size: 42,
                        color: Color(0xFF241F7B),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Color(0xFF241F7B),
                            ),
                          ),
                          Text(
                            email!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: Color(0xFF241F7B),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_android,
                        size: 42,
                        color: Color(0xFF241F7B),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Phone",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Color(0xFF241F7B),
                            ),
                          ),
                          Text(
                            "082111442634",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: Color(0xFF241F7B),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.people,
                        size: 42,
                        color: Color(0xFF241F7B),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Field",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Color(0xFF241F7B),
                            ),
                          ),
                          Text(
                            "Media & Creative Content - Graphic Design",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: Color(0xFF241F7B),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.menu_book_rounded,
                        size: 42,
                        color: Color(0xFF241F7B),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Grade",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: Color(0xFF241F7B),
                            ),
                          ),
                          Text(
                            "4th Semester",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                              color: Color(0xFF241F7B),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 8),
                      backgroundColor: Colors.transparent,
                      foregroundColor: const Color(0xFF241F7B),
                      elevation: 0,
                      side:
                          const BorderSide(color: Color(0xFF241F7B), width: 3),
                    ),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await Auth.LogOut();
                      if (context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 8),
                      backgroundColor: const Color(0xFFED2939),
                      foregroundColor: const Color(0xFF241F7B),
                    ),
                    child: const Text(
                      "LOGOUT",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
