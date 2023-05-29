import 'package:aplika_si/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'about.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              "Edit Profiles",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Username",
                fillColor: const Color.fromARGB(35, 36, 31, 123),
                contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Color.fromARGB(255, 36, 31, 123),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                prefixIconColor: const Color.fromARGB(255, 36, 31, 123),
                filled: true,
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                hintText: "Phone",
                fillColor: const Color.fromARGB(35, 36, 31, 123),
                contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Color.fromARGB(255, 36, 31, 123),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                prefixIconColor: const Color.fromARGB(255, 36, 31, 123),
                filled: true,
                prefixIcon: Icon(Icons.call),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                fillColor: const Color.fromARGB(35, 36, 31, 123),
                contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Color.fromARGB(255, 36, 31, 123),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide.none,
                ),
                prefixIconColor: const Color.fromARGB(255, 36, 31, 123),
                filled: true,
                prefixIcon: Icon(Icons.password),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
                backgroundColor: Colors.transparent,
                foregroundColor: const Color(0xFF241F7B),
                elevation: 0,
                side: const BorderSide(color: Color(0xFF241F7B), width: 3),
              ),
              child: const Text(
                "Edit Profile",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
