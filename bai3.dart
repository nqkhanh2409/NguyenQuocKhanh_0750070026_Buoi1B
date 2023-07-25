import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_app/models/weather_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
  bool _validate = true;
  WeatherApi? weatherInfo;
  var currentTime = 'xx/xx/xxx';

  Future getWeather() async {
    if (_textController.text.isEmpty) {
      _validate = true;
    } else {
      weatherInfo = await WeatherApi.getWeather(_textController.text);
      // print(weatherInfo.name);

      _validate = false;

      DateTime now = DateTime.now();
      currentTime =
          "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Weather App')),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          labelText: "Nhập địa điểm",
                          labelStyle: const TextStyle(fontSize: 25),
                          errorText:
                              _validate ? 'Vui lòng nhập địa điểm' : null),
                      autofocus: false,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: getWeather,
                      child: const FaIcon(FontAwesomeIcons.search)),
                ],
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Cập nhật lúc $currentTime",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.red)),
                    Text(weatherInfo?.name ?? 'Chưa xác định',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                    Text(weatherInfo?.descriptions ?? '',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.normal)),
                  ]),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Wind speed: ${weatherInfo?.windspeed ?? 0}💨",
                      style: const TextStyle(fontSize: 20)),
                  Text("Temperature: ${weatherInfo?.temperature ?? 0}°C",
                      style: const TextStyle(fontSize: 20)),
                  // const Text("Max temp: 45°C", style: TextStyle(fontSize: 20)),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
