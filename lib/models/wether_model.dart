import 'package:whether_app/models/main_model.dart';

class WeatherModel {
  String? main;
  String? description;
  String? icon;
  List<MainData>? mainList;

  WeatherModel({this.main, this.description, this.icon, this.mainList});

  factory WeatherModel.fromJson(Map<String, dynamic> map) {
    return WeatherModel(
      main: map["main"],
      description: map["description"],
      icon: map["icon"],
    );
  }
}
