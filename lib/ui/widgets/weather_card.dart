import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.wind,
    required this.humidity,
    required this.visibility,
  });

  final double wind;
  final double humidity;
  final double visibility;

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
                '50km/h',
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
                '48%',
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
                '1.6km',
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
