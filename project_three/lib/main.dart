import 'package:flutter/material.dart';
import 'package:project_three/weatherList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Essentially a scaffold for the front page, goign form img, to text, to button
class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF163294),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0), //You can use EdgeInsets like above
            margin: EdgeInsets.all(0),
            child: Image.asset("assets/images/front_page_logo.png") ,
          ),
          Container( //apply margin and padding using Container Widget.
            padding: EdgeInsets.all(20), //You can use EdgeInsets like above
            margin: EdgeInsets.all(5),
            child: const Text("Rochester Weather App!", style: TextStyle(fontSize: 50, color: Colors.white,), textAlign: TextAlign.center,),
          ),
          Container(
            child: FittedBox(
              child: RawMaterialButton(
                fillColor: const Color(0xFF411F97),
                //gives it that space
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                child: const Text("Rochester", style: TextStyle(fontSize: 50, color: Colors.white,), textAlign: TextAlign.center,),
                //Sends user to weather list view
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WeatherList(title: "Local Cities")),
                  );
                },
              ),
            ),
              //Box shadow is essentially made here for the botton
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(10, 10), // Shadow position
                  ),
                ],
              )
          ),
          Container(
              child: FittedBox(
                child: RawMaterialButton(
                  fillColor: const Color(0xFF411F97),
                  //gives it that space
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                  child: const Text("NYC", style: TextStyle(fontSize: 50, color: Colors.white,), textAlign: TextAlign.center,),
                  //Sends user to weather list view
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WeatherList(title: "Local Cities")),
                    );
                  },
                ),
              ),
              //Box shadow is essentially made here for the botton
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(10, 10), // Shadow position
                  ),
                ],
              )
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
