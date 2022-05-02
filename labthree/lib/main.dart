import 'package:flutter/material.dart';
import 'package:labthree/listView.dart';
import 'package:labthree/nav.dart';

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
        primarySwatch: Colors.blue,
      //  3 different headlines,
      //  One paragraph
      //
      ),
      home: const MyHomePage(title: 'Question One'),
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Title One',
                style: Theme.of(context).textTheme.headline2
            ),
            Text(
              'Title Two',
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              'Title Three',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: Theme.of(context).textTheme.bodyText1
            )
          ],
        ),
      ),
      floatingActionButton: FittedBox(
        child: RawMaterialButton(
          fillColor: Colors.lightBlue,
          padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
          shape: const RoundedRectangleBorder(),
          child: const Text('Next Question'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuestionTwo(title: "Question Two & Three")),
            );
          },
        ),
      ),

      bottomNavigationBar: myBottomNav(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
