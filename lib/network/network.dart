import 'dart:convert';
import 'package:http/http.dart';
import 'package:weather_application/utilities/forcast_util.dart';
import '../model/weather_forcast_model.dart';

class Network {
  Future<WeatherForcastModel> getWeatherForcast(
      {required String cityName}) async {
    var finalUrl =
        // ignore: prefer_interpolation_to_compose_strings
        'https://api.openweathermap.org/data/2.5/forecast?q=' +
            cityName +
            '&appid=' +
            Util.appId +
            '';
    final response = await get(Uri.parse(Uri.encodeFull(finalUrl)));
    // ignore: avoid_print
    print('URL: ${Uri.encodeFull(finalUrl)}');

    //status code of the network
    if (response.statusCode == 200) {
      //okay all is good
      // print('weather data: ${response.body}');
      return WeatherForcastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error getting weather forecast');
    }
  }
}
