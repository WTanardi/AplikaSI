import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 96),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/himsi_1.png',
                    width: 200,
                    height: 200,
                  ),
                  Image.asset(
                    'assets/images/AplikaSI.png',
                    width: 194,
                    height: 72,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Column(
              children: [
                const CustTextField(
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.person_2_outlined),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustTextField(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustButton(
                  buttonText: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AplikaSI(),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustTextField extends StatelessWidget {
  final String hintText;
  final Icon prefixIcon;

  const CustTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      child: TextField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: const Color.fromARGB(25, 36, 31, 123),
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            color: Color.fromARGB(255, 36, 31, 123),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide.none,
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: const Color.fromARGB(255, 36, 31, 123),
          filled: true,
        ),
      ),
    );
  }
}

class CustButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  const CustButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(45, 0, 0, 0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 14, 0, 14),
              height: 48,
              width: 260,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 31, 123),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            GestureDetector(
              child: Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 36, 31, 123),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.fingerprint,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
