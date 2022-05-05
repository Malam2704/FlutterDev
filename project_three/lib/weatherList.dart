import 'package:flutter/material.dart';
import 'package:project_three/weatherView.dart';

//All cities being used.
List<String> cityNames = ['Monroe', 'Rochester', 'East Rochester', 'Fairport', 'Victor','Webster', 'Canandaigua', 'Honeoye Falls', 'Brockport', 'Spencerport', 'Buffalo', 'Niagara Falls'];

class WeatherList extends StatefulWidget {
  const WeatherList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WeatherList> createState() => WeatherListState();
}

//stateless widget for the entire page
class WeatherListState extends State<WeatherList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Center(
        child: myListView(),
      ),
      backgroundColor: const Color(0xFF411F97),
    );
  }
}

//the actual list, or buttons made from the cityNames list above
class myListView extends StatelessWidget{
  const myListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return makeView();
    //returns a button for each value in city name list, with a set padding, width, and margin
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(5, 25, 5, 25),
      itemCount: cityNames.length,
      itemBuilder: (context, index) {
        return Center(
            child: Container(
              width: 320,
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              //Actual button logic of the city buttons, with color, padding, text being whichever index of the list
              // The current city name gets passed as a parameter because it will be used to send
              // the openweathermap api request, with it's name.
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

