import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  WeatherService(this.dio);
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          "https://api.weatherapi.com/v1/forecast.json?key=2fcdd8d71c77473bb1f230516242909&q=$cityName&days=1");
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          "oops there are an error , try later ";
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there are an error , try later ');
    }
  }
}
