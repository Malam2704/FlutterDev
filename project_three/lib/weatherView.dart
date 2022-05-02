import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:weather/weather.dart';
import 'dart:async';
import 'dart:convert';

class MyWeatherView extends StatefulWidget {
  const MyWeatherView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyWeatherView> createState() => WeatherViewState();
}

class WeatherViewState extends State<MyWeatherView> {
  late Future<List<Weather>> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = fetchWeather(widget.title);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Weather>>(
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return WeatherList(weathers: snapshot.data!, key: null,);
            }
            else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

// List<Orc> parseOrc(String responseBody) {
//   final parsed = jsonDecode(responseBody);
//   print('This is the parsePost method' + responseBody);
//   return parsed.map<Orc>((json) => Orc.fromJson(json)).toList();
// }

Future<List<Weather>> fetchWeather(String cityName) async {
  String key = 'dcd5a01685803cf65da8d4d80ae4ec11';
  WeatherFactory wf = WeatherFactory(key);
  List<Weather> myWeather = [];

  // for(int i=0; i < cityNames.length; i++){
  //   print(i);
    Weather w = await wf.currentWeatherByCityName(cityName);
    myWeather.add(w);
  // }

  return myWeather;
}

class WeatherList extends StatelessWidget {
  final List<Weather> weathers;

  WeatherList ({Key? key, required this.weathers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: weathers.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Weather Man: `${weathers[0]}`')
            ],
          ),

        );
      },
    );
  }
}