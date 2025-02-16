import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:weather_app/models/weather.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Iconify(
                MaterialSymbols.airwave,
                size: 45,
                color: Color.fromARGB(255, 255, 255, 6),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '${weather.wind.toStringAsFixed(0)}m/sec',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Color.fromARGB(255, 255, 255, 6),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'wind',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Color.fromARGB(255, 255, 255, 6)),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Iconify(
                MaterialSymbols.water_drop_outline,
                color: Color.fromARGB(255, 255, 255, 6),
                size: 45,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${weather.humidity}%',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Color.fromARGB(255, 255, 255, 6),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'humidity',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Color.fromARGB(255, 255, 255, 6)),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color: Color.fromARGB(255, 255, 255, 6),
                size: 45,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '${(weather.visibility / 1000).toStringAsFixed(0)}km',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Color.fromARGB(255, 255, 255, 6),
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'visibility',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Color.fromARGB(255, 255, 255, 6)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
