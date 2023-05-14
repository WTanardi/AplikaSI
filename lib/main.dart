import 'package:aplika_si/Service/Auth_Service.dart';
import 'package:aplika_si/login.dart';
import 'package:aplika_si/provider/Events.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/ToDoList.dart';
import 'home_page.dart';
import 'validator.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ToDoModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Events(),
        )
      ],
      child: const MyApp(),
    ),
  );
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
