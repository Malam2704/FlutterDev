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
      backgroundColor: const Color(0xFF163294),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Weather>>(
          future: futureWeather,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return WeatherList(weathers: snapshot.data!, key: null, title: widget.title);
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

Future<List<Weather>> fetchWeather(String cityName) async {
  String key = 'dcd5a01685803cf65da8d4d80ae4ec11';
  WeatherFactory wf = WeatherFactory(key);
  List<Weather> myWeather = [];

  Weather w = await wf.currentWeatherByCityName(cityName);
  myWeather.add(w);

  return myWeather;
}

class WeatherList extends StatelessWidget {
  final List<Weather> weathers;
  final String title;

  WeatherList ({Key? key, required this.weathers, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: weathers.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(0),
                alignment: Alignment.center,
                child: Image.network('http://openweathermap.org/img/w/${weathers[0].weatherIcon}.png', width: 300, fit: BoxFit.cover, ),
              ),
              Container( //apply margin and padding using Container Widget.
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                alignment: Alignment.center,
                child: Text(weathers[0].weatherDescription.toUpperCase(), style: const TextStyle(fontSize: 40, color: Colors.white,), textAlign: TextAlign.center,),
              ),
              Container( //apply margin and padding using Container Widget.
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                alignment: Alignment.center,
                child: Text('${weathers[0].temperature.fahrenheit.toStringAsFixed(0)}°F / ${weathers[0].temperature.celsius.toStringAsFixed(0)}°C', style: const TextStyle(fontSize: 65, color: Colors.white,), textAlign: TextAlign.center,),
              ),
              Container( //apply margin and padding using Container Widget.
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                alignment: Alignment.center,
                child: Text('$title, NY', style: const TextStyle(fontSize: 40, color: Colors.white,), textAlign: TextAlign.center,),
              ),
              Text('Max Temp: ${weathers[0].tempMax.fahrenheit.toStringAsFixed(0)}°F / ${weathers[0].tempMax.celsius.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, color: Colors.white,)),
              Text('Mix Temp: ${weathers[0].tempMin.fahrenheit.toStringAsFixed(0)}°F / ${weathers[0].tempMin.celsius.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, color: Colors.white,)),
              Text('Feels Like Temp: ${weathers[0].tempFeelsLike.fahrenheit.toStringAsFixed(0)}°F / ${weathers[0].tempFeelsLike.celsius.toStringAsFixed(0)}', style: const TextStyle(fontSize: 20, color: Colors.white,)),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                alignment: Alignment.center,
                child: Text('${weathers[0].date}', style: const TextStyle(fontSize: 20, color: Colors.white,), textAlign: TextAlign.center,),)
            ],
          ),

        );
      },
    );
  }
}