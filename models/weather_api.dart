// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherApi {
  String name;
  int temperature;
  String descriptions;
  int windspeed;

  WeatherApi({
    required this.name,
    required this.temperature,
    required this.descriptions,
    required this.windspeed,
  });

  static Future<WeatherApi> getWeather(name) async {
    var uri = Uri.http('api.weatherstack.com', '/current',
        {'access_key': '48f0de7b737f8af832ef26d1b81e7918', 'query': name});
    final respone = await http.get(uri);

    Map data = jsonDecode(respone.body);
    print(data);
    WeatherApi temp = WeatherApi(
        name: data['location']['name'],
        temperature: data['current']['temperature'],
        descriptions: data['current']['weather_descriptions'][0],
        windspeed: data['current']['wind_speed'],
    );

    return temp;
  }
}
