import 'package:flutter/material.dart';
import 'package:labtwo/routes.dart';

import 'main.dart';
import 'nav.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color changingColor = Colors.green;


  void _incrementCounter_and_color() {
    setState(() {
      _counter++;
    });
  }
  void changeYellow(){
    setState(() {
      changingColor = Colors.yellow;
    });
  }
  void changeRed(){
    setState(() {
      changingColor = Colors.red;
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: changingColor,
              width: 160,
              height: 160,),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              margin: const EdgeInsets.only(top:10 ,bottom: 10.0),
              child : FloatingActionButton(
                heroTag: "btn1",
                onPressed: _incrementCounter_and_color,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),),
            FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: Colors.red,
              onPressed: changeRed,
              tooltip: 'Change Color',
              child: GestureDetector(
                onDoubleTap: (){
                  changeYellow();
                },
              ),
            )
          ],
        ),

      ),
      floatingActionButton: FittedBox(
        child: RawMaterialButton(
          fillColor: Colors.purple,
          padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
          shape: new RoundedRectangleBorder(),
          child: Text('Next Question'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuestionTwo()),
            );
          },
        ),
      ),



      // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: myBottomNav(),
    );
  }
}
