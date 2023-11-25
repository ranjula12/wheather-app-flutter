import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whether_app/models/data_coloction.dart';
import 'package:whether_app/screens/weather_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String te = "";
  DataCollection? allData;
  double? lon;
  double? lat;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    TextEditingController queryController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "weather app",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade500,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  fit: BoxFit.cover,
                  image: const NetworkImage(
                      "https://miro.medium.com/v2/resize:fit:2000/0*Q2EFk7g36R0h8dAZ"))),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "please enter city  ",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: size.width - 20,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: queryController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                            hintStyle: TextStyle(color: Colors.grey.shade300)),
                        style: TextStyle(color: Colors.grey.shade300),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  WetherPage(query: queryController.text),
                            ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              const SizedBox(
                height: 15,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Container(
                      width: 300,
                      height: 480,
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.white10),
                        gradient: const LinearGradient(
                          colors: [Colors.white60, Colors.white10],
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Guidelines",
                            style: TextStyle(
                                fontSize: 25, color: Colors.grey.shade900),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "01. Enter the city name correctly.",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "02. Tap the seach icon once.",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "03. Then you navigate in to resultant page.",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade900),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            height: 180,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    colorFilter: ColorFilter.mode(
                                        Colors.black.withOpacity(0.4),
                                        BlendMode.darken),
                                    fit: BoxFit.cover,
                                    image: const NetworkImage(
                                        "https://t4.ftcdn.net/jpg/02/66/38/15/360_F_266381525_alVrbw15u5EjhIpoqqa1eI5ghSf7hpz7.jpg")),
                                color: Colors.white.withAlpha(100)),
                          ),
                          const Spacer(),
                          const Divider(),
                          const Text(
                            "© 2023 Ranjula| All Rights Reserved",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
