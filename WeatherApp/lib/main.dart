import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_theme_states.dart';
import 'package:weather_app/cubits/get_weather_cubti/get_theme_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubti/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubti/get_weather_states.dart';
import 'package:weather_app/views/howm_view_toggle_theme.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetWeatherCubit(),
        ),
        BlocProvider(
          create: (context) => GetThemeCubit(),
        ),
      ],
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return BlocBuilder<GetThemeCubit, GetThemeStates>(
              builder: (context, state) {
                if (state is LightTheme) {
                  return MaterialApp(
                    theme: ThemeData.light().copyWith(
                      scaffoldBackgroundColor:
                          Colors.grey, // Set background color for light mode
                      appBarTheme: const AppBarTheme(
                        color: Colors.grey, // Set AppBar color for light mode
                      ),
                    ),
                    debugShowCheckedModeBanner: false,
                    home: const HomeViewToggle(),
                  );
                } else {
                  return MaterialApp(
                    theme: ThemeData.dark().copyWith(
                      scaffoldBackgroundColor: Colors.green[
                          900], // Set background color for dark mode (dark green)
                      appBarTheme: AppBarTheme(
                        color: Colors
                            .green[900], // Set AppBar color for light mode
                      ),
                    ),
                    debugShowCheckedModeBanner: false,
                    home: const HomeViewToggle(),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Partly cloudy':
      return Colors.blue;
    case 'Cloudy':
      return Colors.blueGrey;
    case 'Overcast':
      return Colors.grey;
    case 'Mist':
      return Colors.cyan;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Light rain':
      return Colors.lightBlue;
    case 'Patchy snow possible':
    case 'Light snow':
      return Colors.indigo;
    case 'Thundery outbreaks possible':
      return Colors.deepPurple;

    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Heavy rain':
    case 'Torrential rain shower':
      return Colors.blue;
    case 'Patchy light snow':
    case 'Moderate snow':
      return Colors.lightBlue;
    case 'Moderate or heavy snow with thunder':
      return Colors.deepOrange;
    default:
      return Colors.blue;
  }
}


   // theme: ThemeData(
                  //     appBarTheme: Theme.of(context).appBarTheme.copyWith(
                  //           color: getThemeColor(
                  //               BlocProvider.of<GetWeatherCubit>(context)
                  //                   .weatherModel
                  //                   ?.weatherCondition),
                  //         ))