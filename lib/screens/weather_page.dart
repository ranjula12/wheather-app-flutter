import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:whether_app/models/data_coloction.dart';
import 'package:whether_app/services/services.dart';
import 'package:whether_app/widget/custom_row.dart';

class WetherPage extends StatefulWidget {
  const WetherPage({super.key, required this.query});
  final String query;
  @override
  State<WetherPage> createState() => _WetherPageState();
}

class _WetherPageState extends State<WetherPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
                    height: 30,
                  ),
                  FutureBuilder(
                    future: ApiServices().getGeoCoding(widget.query),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return FutureBuilder(
                                  future: ApiServices().getAll(
                                      snapshot.data![index].lat!,
                                      snapshot.data![index].lon!),
                                  builder: (context, snap) {
                                    if (snap.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    // if (snap.hasData) {
                                    DataCollection? data = snap.data;

                                    return Column(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 2, sigmaY: 2),
                                            child: Container(
                                              width: 300,
                                              height: 480,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 3,
                                                    color: Colors.white10),
                                                gradient: const LinearGradient(
                                                  colors: [
                                                    Colors.white60,
                                                    Colors.white10
                                                  ],
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    data!.name!,
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: NetworkImage(
                                                                  "https://openweathermap.org/img/wn/${data.weather!.icon!}@2x.png")),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          color: Colors.white
                                                              .withAlpha(80))),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  CustomRow(
                                                    title:
                                                        "${data.weather!.main!} : ${data.weather!.description!}",
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustomRow(
                                                    title:
                                                        "Temperature : ${data.maindata![0].temp!.toStringAsFixed(2)} °C",
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustomRow(
                                                    title:
                                                        "(Feel Like)  : ${data.maindata![0].feelLike!.toStringAsFixed(2)} °C",
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustomRow(
                                                    title:
                                                        "(Minimum)  : ${data.maindata![0].tempMin!.toStringAsFixed(2)} °C",
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustomRow(
                                                    title:
                                                        "(Maximum)  : ${data.maindata![0].tempMax!.toStringAsFixed(2)} °C",
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustomRow(
                                                    title:
                                                        "Pressure  :${data.maindata![0].presure! / 100} Pa",
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  CustomRow(
                                                    title:
                                                        "Visibility  :${data.visibility! / 1000} KM",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    );
                                    // }
                                    //return const SizedBox();
                                  },
                                );
                              }),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
