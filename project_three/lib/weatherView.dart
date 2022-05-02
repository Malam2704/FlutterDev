import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class WeatherView extends StatefulWidget {
  const WeatherView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WeatherView> createState() => JsonClassState();
}

class JsonClassState extends State<WeatherView> {
  late Future<List<Orc>> futureOrcs;

  @override
  void initState() {
    super.initState();
    futureOrcs = fetchOrcs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder<List<Orc>>(
          future: futureOrcs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return OrcList(orcs: snapshot.data!, key: null,);
            }
            else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

List<Orc> parseOrc(String responseBody) {
  final parsed = jsonDecode(responseBody);
  print('This is the parsePost method' + responseBody);
  return parsed.map<Orc>((json) => Orc.fromJson(json)).toList();
}

Future<List<Orc>> fetchOrcs() async {
  final response = await http.get(Uri.parse('https://people.rit.edu/ma3655/orcs.json'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return parseOrc(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load posts');
  }
}

class OrcList extends StatelessWidget {
  final List<Orc> orcs;

  OrcList ({Key? key, required this.orcs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: orcs.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('User Id: ${orcs[index].id}'),
              Text('Name: ${orcs[index].name}'),
              Text('Health: ${orcs[index].health}'),
              Text('Attack: ${orcs[index].attack}'),
              Text('Defense: ${orcs[index].defense}'),
              Text('Token: ${orcs[index].token}'),
            ],
          ),

        );
      },
    );
  }
}