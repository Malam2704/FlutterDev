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
          scaffoldBackgroundColor: const Color(0xFF163294), primarySwatch: Colors.blue
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

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(163294),
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
          FittedBox(
            child: RawMaterialButton(
              fillColor: const Color(0xFF411F97),
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
              shape: const RoundedRectangleBorder(),
              child: const Text("Open", style: TextStyle(fontSize: 50, color: Colors.white,), textAlign: TextAlign.center,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherList(title: "Local Cities")),
                );
              },
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
