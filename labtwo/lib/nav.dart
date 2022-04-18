import 'package:flutter/material.dart';
import 'package:labtwo/two.dart';

import 'main.dart';
import 'one.dart';

// myBottomBar extends BottomAppBar(
//         color: Colors.white,
//         child: Row(
//           children: [
//             IconButton(icon: Icon(Icons.navigate_next), onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const QuestionTwo()),
//               );
//             }),
//             IconButton(icon: Icon(Icons.search), onPressed: () {}),
//             IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
//           ],
//         ),
//       )

class myBottomNav extends StatelessWidget {
  const myBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.blue,
        child: Row(
          children: [
            IconButton(icon: Icon(Icons.navigate_before), onPressed: () {
            Navigator.of(context).pop();
            }),
            IconButton(icon: Icon(Icons.navigate_next), onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QuestionTwo()),
              );
            }),
          ],
        ),
    );
  }
}
