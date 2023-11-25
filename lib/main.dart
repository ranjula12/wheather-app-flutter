import 'package:flutter/material.dart';
import 'package:whether_app/screens/home_page.dart';
import 'package:whether_app/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'whether app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const Splash(),
        '/home': (context) => const HomePage(),
      },
      // home: const HomePage(),
    );
  }
}
