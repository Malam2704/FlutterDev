import 'package:flutter/material.dart';
import 'package:labtwo/two.dart';

import 'one.dart';

void main() {
  // runApp(const MyApp());
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const QuestionOne(),
      '/second': (context) => const QuestionTwo(),
    },
  ));
}

class QuestionOne extends StatelessWidget {
  const QuestionOne({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class QuestionTwo extends StatelessWidget {
  const QuestionTwo({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Question Two',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const RadioRow(),
    );
  }
}

class QuestionThree extends StatelessWidget {
  const QuestionThree({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Question Two',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const RadioRow(),
    );
  }
}


