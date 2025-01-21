import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_theme_states.dart';
import 'package:weather_app/cubits/get_weather_cubti/get_theme_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubti/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubti/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeViewToggle extends StatelessWidget {
  const HomeViewToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SearchView()));
            },
            icon: const Icon(Icons.search),
          ),
          // Add Switch to toggle between light and dark themes
          BlocBuilder<GetThemeCubit, GetThemeStates>(
            builder: (context, state) {
              bool isDarkMode =
                  BlocProvider.of<GetThemeCubit>(context).isDarkMode;

              return IconButton(
                      onPressed: () {
                        var getThemeMode =
                            BlocProvider.of<GetThemeCubit>(context);
                        getThemeMode.toggleTheme();
                      },
                      icon:
                          Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode))
                  //  Switch(
                  //   value: isDarkMode, // Track the current theme mode
                  //   onChanged: (value) {
                  //     var getThemeMode = BlocProvider.of<GetThemeCubit>(context);
                  //     getThemeMode
                  //         .toggleTheme(); // Toggle the theme mode on switch change
                  //   },
                  // )

                  ;
            },
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weather: state.weatherModel);
          } else {
            return const Center(
              child: Text("Oops, there was an error. Please try again later."),
            );
          }
        },
      ),
    );
  }
}
