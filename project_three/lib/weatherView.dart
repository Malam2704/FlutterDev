import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'dart:async';

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
            return const CircularProgressIndicator();
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

  // Print here is to show the Request Output,
  // sometimes cities have null values for things such as weather
  if (kDebugMode) {
    print(w);
  }

  return myWeather;
}

class WeatherList extends StatelessWidget {
  final List<Weather> weathers;
  final String title;

  const WeatherList ({Key? key, required this.weathers, required this.title}) : super(key: key);

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
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                alignment: Alignment.center,
                child: Text(weathers[0].weatherDescription!.toUpperCase(), style: const TextStyle(fontSize: 40, color: Colors.white,), textAlign: TextAlign.center,),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                alignment: Alignment.center,
                child: Text('${weathers[0].temperature?.fahrenheit?.toStringAsFixed(0)}°F / ${weathers[0].temperature?.celsius?.toStringAsFixed(0)}°C', style: const TextStyle(fontSize: 65, color: Colors.white,), textAlign: TextAlign.center,),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 25),
                alignment: Alignment.center,
                child: Text('$title, NY', style: const TextStyle(fontSize: 40, color: Colors.white,), textAlign: TextAlign.center,),
              ),


              Container(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Max Temp: ${weathers[0].tempMax?.fahrenheit?.toStringAsFixed(0)}°F / ${weathers[0].tempMax?.celsius?.toStringAsFixed(0)}°C', style: const TextStyle(fontSize: 20, color: Colors.white,)),
                    Text('Mix Temp: ${weathers[0].tempMin?.fahrenheit?.toStringAsFixed(0)}°F / ${weathers[0].tempMin?.celsius?.toStringAsFixed(0)}°C', style: const TextStyle(fontSize: 20, color: Colors.white,)),
                    Text('Feels Like Temp: ${weathers[0].tempFeelsLike?.fahrenheit?.toStringAsFixed(0)}°F / ${weathers[0].tempFeelsLike?.celsius?.toStringAsFixed(0)}°C', style: const TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Sunrise: ${weathers[0].sunrise}', style: const TextStyle(fontSize: 20, color: Colors.orange,)),
                      Text('Sunset: ${weathers[0].sunset}', style: const TextStyle(fontSize: 20, color: Colors.yellow,)),
                  ],
                ),
              ),

              Container(
                margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                alignment: Alignment.center,
                child: Text('${weathers[0].date}', style: const TextStyle(fontSize: 20, color: Colors.white,), textAlign: TextAlign.center,),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                alignment: Alignment.center,
                child: RawMaterialButton(
                  fillColor: const Color(0xFF411F97),
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                  child: const Text("Go Back", style: TextStyle(fontSize: 30, color: Colors.white,)), onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

            ],
          ),

        );
      },
    );
  }
}

