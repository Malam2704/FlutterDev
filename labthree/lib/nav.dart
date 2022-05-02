import 'package:flutter/material.dart';
import 'package:labthree/JsonClass.dart';
import 'package:labthree/listContainers.dart';
import 'package:labthree/listView.dart';
import 'main.dart';

class myBottomNav extends StatelessWidget {
  const myBottomNav({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.navigate_before), onPressed: () {
            Navigator.of(context).pop();
          }),
          IconButton(icon: Icon(Icons.filter_1), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage(title: "Home Page")),
            );
          }),
          IconButton(icon: Icon(Icons.filter_2), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuestionTwo(title: "Question Two & Three")),
            );
          }),
          IconButton(icon: Icon(Icons.filter_3), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuestionThree(title: "Question Three Extra")),
            );
          }),
          IconButton(icon: Icon(Icons.filter_4), onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JsonClass(title: "Orcs, Orcs, Orcs!")),
            );
          })
        ],
      ),
    );
  }
}
