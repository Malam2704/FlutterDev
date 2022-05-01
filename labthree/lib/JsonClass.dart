import 'package:flutter/material.dart';

class JsonClass extends StatefulWidget {
  const JsonClass({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<JsonClass> createState() => JsonClassState();
}

class JsonClassState extends State<JsonClass> {

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

class Orc{
  int id;
}