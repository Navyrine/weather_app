import 'package:flutter/material.dart';
import 'package:weather_app/ui/widgets/weather_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home Page',
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
              'Date',
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
            'Weather',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Transform.translate(
            offset: Offset(0, -10),
            child: Text(
              '30°',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 150,
                  ),
              textHeightBehavior: TextHeightBehavior(
                  leadingDistribution: TextLeadingDistribution.proportional),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Ahsjdhhakhdkhakhdkjajkhdhashdjkhajhdkjhashdjhakjhdjkhaskjhdjkhasjhdjkhakdhkjshjdkakhdkahjdkhasjhdkjhasjdhkah',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
          WeatherCard(
            wind: 4,
            humidity: 48,
            visibility: 50,
          ),
        ],
      ),
    );
  }
}
