import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:weather_app/models/weather.dart';

class WeatherNotifier extends StateNotifier<AsyncValue<Weather>> {
  WeatherNotifier() : super(const AsyncValue.loading()) {
    getWeatherData();
  }

  Future<void> getWeatherData() async {
    try {
      Location location = Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      // Periksa apakah layanan lokasi aktif
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
        await Future.delayed(Duration(seconds: 2));
      }

      // Periksa apakah izin lokasi diberikan
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      // Ambil lokasi pengguna
      locationData = await location.getLocation();
      final latitude = locationData.latitude;
      final longitude = locationData.longitude;
      final DateTime now = DateTime.now();
      final currentDate = DateTime(now.year, now.month, now.day);
      final currentDay = DateTime(now.day);

      final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=12794b371056bc13eafb628cde7d5adf&units=metric',
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        final city = jsonData['sys']['country'];
        final weather = jsonData['weather'][0]['main'];
        final description = jsonData['weather'][0]['description'];
        final temperature = jsonData['main']['temp'];
        final wind = jsonData['wind']['speed'];
        final humidity = jsonData['main']['humidity'];
        final visibility = jsonData['visibility'];

        final data = Weather(
          city: city,
          date: currentDate,
          day: currentDay,
          weather: weather,
          description: description,
          temperature: temperature,
          wind: wind,
          humidity: humidity,
          visibility: visibility,
        );

        state = AsyncValue.data(data);
        print('tipe data wind : ${wind.runtimeType}');
        print('tipe data humidity : ${humidity.runtimeType}');
        print('tipe data visibility : ${visibility.runtimeType}');
      } else {
        state = AsyncValue.error('url not found', StackTrace.current);
      }
    } catch (error) {
      state = AsyncValue.error(
          'Failed to fetch data: \n$error', StackTrace.current);
      print(error);
    }
  }
}

final weatherProvider =
    StateNotifierProvider<WeatherNotifier, AsyncValue<Weather>>(
        (ref) => WeatherNotifier());
