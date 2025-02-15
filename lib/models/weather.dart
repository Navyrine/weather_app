class Weather {
  final String city;
  final DateTime date;
  final DateTime day;
  final String weather;
  final String description;
  final double temperature;
  final double wind;
  final int humidity;
  final int visibility;

  const Weather({
    required this.city,
    required this.date,
    required this.day,
    required this.weather,
    required this.description,
    required this.temperature,
    required this.wind,
    required this.humidity,
    required this.visibility,
  });
}
