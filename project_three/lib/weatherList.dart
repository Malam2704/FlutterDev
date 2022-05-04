import 'package:flutter/material.dart';
import 'package:project_three/weatherView.dart';

List<String> myList = ["a",'b','c','d','e','f','g','h','i','j','k','l'];
List<String> cityNames = ['Monroe', 'Rochester', 'East Rochester', 'Fairport', 'Victor','Webster', 'Canandaigua', 'Honeoye Falls', 'Brockport', 'Spencerport', 'Buffalo', 'Niagara Falls'];

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
      backgroundColor: const Color(0xFF411F97),
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
      padding: const EdgeInsets.fromLTRB(5, 25, 5, 25),
      itemCount: cityNames.length,
      itemBuilder: (context, index) {
        return Center(
            child: Container(
              width: 320,
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: RawMaterialButton(
                fillColor: const Color(0xFF163294),
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                child: Text(cityNames[index], style: const TextStyle(fontSize: 30, color: Colors.white,)), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWeatherView(title: cityNames[index])),
                );
                },
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(10, 10), // Shadow position
                  ),
                ],
              ),
            )
        );
      },
    );
  }
}

