import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/cubits/get_weather_cubti/get_weather_cubit.dart';
import 'package:weather_app/views/main_original.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getThemeColor(weatherModel.weatherCondition),
        getThemeColor(weatherModel.weatherCondition)[300]!,
        getThemeColor(weatherModel.weatherCondition)[50]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              DateFormat('HH:mm').format(DateTime.parse(weatherModel.date)),
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 120,
                  width: 120,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(weatherModel.image.contains("https:")
                        ? weatherModel.image
                        : "https:${weatherModel.image}"),
                  ),
                ),
                // CachedNetworkImage(
                //   imageUrl: weatherModel.image.contains("https:")
                //       ? weatherModel.image
                //       : "https:${weatherModel.image}",
                // ),
                Text(
                  weatherModel.temp.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Maxtemp: ${weatherModel.maxTemp}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Maxtemp: ${weatherModel.minTemp}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
