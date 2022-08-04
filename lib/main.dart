import 'package:flutter/material.dart';
import './random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Variables
    //     home: Text(
    //   'hello world',
    //   style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 76, 195, 80)),
    // ));
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.purple),
      // home: Scaffold(
      //     appBar: AppBar(title: Text('word generator')),
      //     body: Center(child: Text(wordPair.asPascalCase))
      //     )
      home: RandomWords(),
    );
  }
}
