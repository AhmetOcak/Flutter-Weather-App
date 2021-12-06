class WeatherResponse {
  final String? cityName;
  final String? temp;
  final String? feelsLike;
  final String? maxTemp;
  final String? minTemp;
  final String? pressure;
  final String? windSpeed;
  final String? sunRise;
  final String? sunSet;
  final String? humidity;
  final String? description;

  WeatherResponse({
    this.cityName,
    this.temp,
    this.feelsLike,
    this.maxTemp,
    this.minTemp,
    this.pressure,
    this.windSpeed,
    this.sunRise,
    this.sunSet,
    this.humidity,
    this.description,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'].toString();
    final temp = json['main']['temp'].toString();
    final feelsLike = json['main']['feels_like'].toString();
    final maxTemp = json['main']['temp_max'].toString();
    final minTemp = json['main']['temp_min'].toString();
    final pressure = json['main']['pressure'].toString();
    final windSpeed = json['wind']['speed'].toString();
    final sunRise = json['sys']['sunrise'].toString();
    final sunSet = json['sys']['sunset'].toString();
    final humidity = json['main']['humidity'].toString();
    final description = json['weather'][0]['description'].toString();

    return WeatherResponse(
      cityName: cityName,
      temp: temp,
      feelsLike: feelsLike,
      maxTemp: maxTemp,
      minTemp: minTemp,
      pressure: pressure,
      windSpeed: windSpeed,
      sunRise: sunRise,
      sunSet: sunSet,
      humidity: humidity,
      description: description,
    );
  }
}
