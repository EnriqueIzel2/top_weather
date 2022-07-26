class WeatherResponse {
  final String cityName;
  final TemperatureInfo tempInfo;

  WeatherResponse({required this.cityName, required this.tempInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final tempInfoJson = json['main'];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    return WeatherResponse(cityName: cityName, tempInfo: tempInfo);
  }
}

class TemperatureInfo {
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json["temp"];
    return TemperatureInfo(temperature: temperature);
  }
}
