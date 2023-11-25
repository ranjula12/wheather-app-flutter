class CityModel {
  String? name;
  double? lat;
  double? lon;
  String? state;

  CityModel({this.name, this.lat, this.lon, this.state});

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      name: map["name"],
      lat: map["lat"].toDouble(),
      lon: map["lon"].toDouble(),
      state: map["state"],
    );
  }
}
