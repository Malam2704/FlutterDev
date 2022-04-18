import 'package:flutter/material.dart';

import 'main.dart';
import 'nav.dart';

enum RadioOptions { lafayette, jefferson }

class RadioRow extends StatefulWidget{
  const RadioRow({Key? key}) : super(key: key);

  @override
  RadioRowState createState() => RadioRowState();
}

class RadioRowState extends State<RadioRow> {
  String changes = "You";
  RadioOptions? _character = RadioOptions.lafayette;

  void updateBoard() {
    if (_character == RadioOptions.lafayette) {
      changes = "Chosen #1";
    } else if (_character == RadioOptions.jefferson) {
      changes = "Chosen #2";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Choose Your Font Size!"),
          backgroundColor: Colors.deepOrange,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                changes,
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              ListTile(
                title: const Text('Lafayette'),
                leading: Radio<RadioOptions>(
                  value: RadioOptions.lafayette,
                  groupValue: _character,
                  onChanged: (RadioOptions? value) {
                    setState(() {
                      _character = value;
                      updateBoard();
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Thomas Jefferson'),
                leading: Radio<RadioOptions>(
                  value: RadioOptions.jefferson,
                  groupValue: _character,
                  onChanged: (RadioOptions? value) {
                    setState(() {
                      _character = value;
                      updateBoard();
                    });
                  },
                ),
              ),
              // DropdownButton(
              //   items: <String>['One', 'Two', 'Free', 'Four']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              //
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       changes = newValue!;
              //     });
              //   },
              // ),
            ],
          ),
        ),

        floatingActionButton: FittedBox(
          child: RawMaterialButton(
            fillColor: Colors.purple,
            padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
            shape: const RoundedRectangleBorder(),
            child: const Text('Next Question'),
            onPressed: () {
              Navigator.pop(
                context
              );
            },
          ),
        ),
      bottomNavigationBar: myBottomNav(),
    );
  }

}
