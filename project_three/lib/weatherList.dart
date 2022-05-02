import 'package:flutter/material.dart';
import 'package:project_three/weatherView.dart';

import 'main.dart';

List<String> myList = ["a",'b','c','d','e','f','g','h','i','j','k','l'];
List<String> cityNames = ['West Henrietta', 'Rochester', 'East Rochester', 'Penfield', 'Victor','Webster'];

class WeatherList extends StatefulWidget {
  const WeatherList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WeatherList> createState() => WeatherListState();
}

class WeatherListState extends State<WeatherList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: myListView(),
      ),
    );
  }
}

class myListView extends StatelessWidget{
  myListView({Key? key}) : super(key: key);
  int shade = 900;

  @override
  Widget build(BuildContext context) {
    // return makeView();
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      itemCount: cityNames.length,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          color: Colors.blue[400],
          margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: Center(child: FittedBox(
          child: RawMaterialButton(
          fillColor: Colors.purple,
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
            shape: const RoundedRectangleBorder(),
            child: Text(cityNames[index]),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyWeatherView(title: cityNames[index])),
              );
            },
          ),
        )),
        );
      },
    );
  }
}

