import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/ui/widgets/weather_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherProvider);

    return weatherState.when(
      data: (weather) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              weather.city,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${DateFormat('EEEE').format(weather.day)}, ${DateFormat('dd MMMM yyyy').format(weather.date)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: Color.fromARGB(255, 255, 255, 6),
                      ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                weather.weather,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Transform.translate(
                offset: Offset(0, -10),
                child: Text(
                  '${weather.temperature.toStringAsFixed(0)}°',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 150,
                      ),
                  textHeightBehavior: TextHeightBehavior(
                      leadingDistribution:
                          TextLeadingDistribution.proportional),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      weather.description,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                    ),
                  ),
                ),
              ),
              WeatherCard(
                weather: weather,
              ),
            ],
          ),
        );
      },
      error: (error, stack) => Center(
        child: Text(error.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
