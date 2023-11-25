import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:whether_app/models/city_model.dart';
import 'package:whether_app/models/data_coloction.dart';

class ApiServices {
  String geoCoding = "http://api.openweathermap.org/geo/1.0/direct?q=";
  String getHistory = "https://api.openweathermap.org/data/2.5/weather?lat=";
  String key = "de925d25307b911ce23389b5aeaaf793";

 
  Future<List<CityModel>?> getGeoCoding(String cityName) async {
    Response response =
        await get(Uri.parse("$geoCoding$cityName&limit=5&appid=$key"));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<CityModel> cities = body.map((e) => CityModel.fromJson(e)).toList();

      return cities;
    } else {
      return [];
    }
  }

  Future<DataCollection?> getAll(double lat, double lon) async {
    Response response =
        await get(Uri.parse("$getHistory$lat&lon=$lon&appid=$key"));

    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      DataCollection data = DataCollection.fromJson(body);
   
      return data;
    } else {
      Logger().e(response.body);
      return null;
    }
  }
}
