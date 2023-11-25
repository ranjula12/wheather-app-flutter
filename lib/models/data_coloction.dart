import 'package:whether_app/models/main_model.dart';
import 'package:whether_app/models/wether_model.dart';

class DataCollection {
  WeatherModel? weather;
  List<MainData>? maindata;
  String? name;
  int? visibility;
  DataCollection({this.maindata, this.weather, this.name, this.visibility});

  factory DataCollection.fromJson(Map<String, dynamic> map) {
    List<dynamic> wetherdata = map["weather"];
    Map<String, dynamic> w = wetherdata[0];
    WeatherModel wethers = WeatherModel.fromJson(w);

    List<MainData> ml = {(MainData.fromJson(map["main"]))}.toList();
    return DataCollection(
        maindata: ml,
        weather: wethers,
        name: map["name"],
        visibility: map["visibility"]);
  }
}
