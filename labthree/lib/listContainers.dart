import 'package:flutter/material.dart';

import 'JsonClass.dart';

class QuestionThree extends StatefulWidget {
  const QuestionThree({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<QuestionThree> createState() => QuestionThreeState();
}

class QuestionThreeState extends State<QuestionThree> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: myListView(),
      ),
      floatingActionButton: FittedBox(
        child: RawMaterialButton(
          fillColor: Colors.purple,
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
          shape: const RoundedRectangleBorder(),
          child: const Text('Next Question'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JsonClass(title: "JSON Data")),
            );
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class myListView extends StatelessWidget{
  myListView({Key? key}) : super(key: key);
  int shade = 900;

  @override
  Widget build(BuildContext context) {
    // return makeView();
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.blue[900],
          child: const Center(child: Text("Hmmm")),
        ),
        Container(
          height: 50,
          color: Colors.lightBlue[800],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.lightBlue[700],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );

  }
}