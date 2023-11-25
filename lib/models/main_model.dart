class MainData {
  double? temp;
  double? feelLike;
  int? presure;
  double? tempMin;
  double? tempMax;

  MainData(
      {this.feelLike, this.presure, this.temp, this.tempMax, this.tempMin});

  factory MainData.fromJson(Map<String, dynamic> map) {
    return MainData(
      feelLike: map["feels_like"] - 273.15,
      presure: map["pressure"],
      temp: map["temp"] - 273.15,
      tempMax: map["temp_max"] - 273.15,
      tempMin: map["temp_min"] - 273.15,
    );
  }
}
