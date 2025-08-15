import 'package:dio/dio.dart';
import 'package:weather_app/app/config/common/constant_value.dart';
import 'package:weather_app/data/models/current_weather_response.dart';
import 'package:weather_app/data/models/forecast_weather_response.dart';

class WeatherDatasource {
  Dio dio = Dio();
  Future<CurrentWeatherResponse> fetchCurrentWeather(
    Map<String, dynamic> request,
  ) async {
    try {
      var result = await dio.get("${urlAPI}weather", queryParameters: request);
      return CurrentWeatherResponse.fromJson(result.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<ForecastWeatherResponse> fetchForecastWeather(
    Map<String, dynamic> request,
  ) async {
    try {
      var result = await dio.get("${urlAPI}forecast", queryParameters: request);
      return ForecastWeatherResponse.fromJson(result.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
