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
      home: const MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Essentially a scaffold for the front page, going form img, to text, to button
class _MyHomePageState extends State<MyHomePage> {

  //List of city & Towns
  List<String> rocNames = ['Monroe', 'Rochester', 'East Rochester', 'Fairport', 'Victor','Webster', 'Canandaigua', 'Honeoye Falls', 'Brockport', 'Spencerport', 'Buffalo', 'Niagara Falls'];
  List<String> nycNames = ['New York','Elmhurst','Jackson Heights','Rego Park', 'Forest Hills'];
  List<String> miaNames = ['Miami','West Palm Beach','Fort Lauderdale','Boca Raton', 'Hollywood'];
  List<String> chiNames = ['Chicago'];
  List<String> sfaNames = ['San Francisco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF163294),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            //Home Screen Picture
            Container(
              padding: EdgeInsets.all(0),
              margin: const EdgeInsets.fromLTRB(50, 150, 50, 10),
              child: Image.asset("assets/images/front_page_logo.png") ,
            ),

            //Home Screen Text
            Container(
              padding: EdgeInsets.all(20), //You can use EdgeInsets like above
              margin: EdgeInsets.all(5),
              child: const Text("Local Weather App", style: TextStyle(fontSize: 50, color: Colors.white,), textAlign: TextAlign.center,),
            ),

            //Home Screen Buttons
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(10),
                      child: FittedBox(
                        child: RawMaterialButton(
                          fillColor: const Color(0xFF411F97),
                          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                          child: const Text("Rochester", style: TextStyle(fontSize: 50, color: Colors.white,), textAlign: TextAlign.center,),
                          //Sends user to weather list view
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WeatherList(title: "Rochester Metro Area", cityNames: rocNames,)),
                            );
                          },
                        ),
                      ),
                      //Box shadow is essentially made here for the botton
                      decoration: BoxDecoration(
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
                      margin: EdgeInsets.all(10),
                      child: FittedBox(
                        child: RawMaterialButton(
                          fillColor: const Color(0xFF411F97),
                          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                          child: const Text("NYC Area", style: TextStyle(fontSize: 50, color: Colors.white,), textAlign: TextAlign.center,),
                          //Sends user to weather list view
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WeatherList(title: "New York Metro Area", cityNames: nycNames,)),
                            );
                          },
                        ),
                      ),
                      //Box shadow is essentially made here for the botton
                      decoration: BoxDecoration(
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
                      margin: EdgeInsets.all(10),
                      child: FittedBox(
                        child: RawMaterialButton(
                          fillColor: const Color(0xFF411F97),
                          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                          child: const Text("Miami Area", style: TextStyle(fontSize: 50, color: Colors.white,), textAlign: TextAlign.center,),
                          //Sends user to weather list view
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WeatherList(title: "Miami Metro Area", cityNames: miaNames,)),
                            );
                          },
                        ),
                      ),
                      //Box shadow is essentially made here for the botton
                      decoration: BoxDecoration(
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
                      margin: EdgeInsets.all(10),
                      child: FittedBox(
                        child: RawMaterialButton(
                          fillColor: const Color(0xFF411F97),
                          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                          child: const Text("Chicago Area", style: TextStyle(fontSize: 50, color: Colors.white,), textAlign: TextAlign.center,),
                          //Sends user to weather list view
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WeatherList(title: "Chicago Metro Area", cityNames: chiNames,)),
                            );
                          },
                        ),
                      ),
                      //Box shadow is essentially made here for the botton
                      decoration: BoxDecoration(
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
                      margin: EdgeInsets.all(10),
                      child: FittedBox(
                        child: RawMaterialButton(
                          fillColor: const Color(0xFF411F97),
                          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20),)),
                          child: const Text("San Francisco", style: TextStyle(fontSize: 50, color: Colors.white,), textAlign: TextAlign.center,),
                          //Sends user to weather list view
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WeatherList(title: "San Francisco Metro Area", cityNames: sfaNames,)),
                            );
                          },
                        ),
                      ),
                      //Box shadow is essentially made here for the botton
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(10, 10), // Shadow position
                          ),
                        ],
                      )
                  ),

                  //Space at the Bottom
                  SizedBox(height: 100),
                ],
              ),
            )

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
