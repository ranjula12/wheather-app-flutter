import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = const Duration(seconds: 8);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: content(),
    );
  }
}

Widget content() {
  return Container(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Lottie.asset("assets/splash_screen.json"),
      const Text(
        "Weather App",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
      const Text(
        "-Developed by Ranjula-",
        style: TextStyle(fontSize: 18, color: Colors.white),
      )
    ],
  ));
}
