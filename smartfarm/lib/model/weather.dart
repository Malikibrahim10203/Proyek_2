class Weather {
  double? temp;
  double? feelsLike;
  double? low;
  double? high;
  String? description;

  Weather({this.temp, this.feelsLike, this.low, this.high, this.description});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      low: json['main']['temp_min'].toDouble(),
      high: json['main']['temp_max'].toDouble(),
      description: json['weather'][0]['description'],
    );
  }
}