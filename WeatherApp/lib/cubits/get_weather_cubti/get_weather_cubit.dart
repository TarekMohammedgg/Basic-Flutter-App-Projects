import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubti/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/sevices/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(NoWeatherState());
   WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(Dio()).getWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(FailuerWeatherState(errorMessage: e.toString()));
    }
  }
}
