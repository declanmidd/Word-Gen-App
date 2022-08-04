import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWords = <WordPair>[];

  // * A set is a collection of objects that can only appear once. No multple objects //
  final _savedWords = Set<WordPair>();
  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, item) {
          final index = item ~/ 2;
          if (item.isOdd) return Divider();
          if (index >= _randomWords.length) {
            _randomWords.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_randomWords[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWords.contains(pair);
    return ListTile(
      title: Text(pair.asPascalCase, style: TextStyle(fontSize: 20)),
      // trailing: Icon(Icons.favorite),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _savedWords.remove(pair);
          } else {
            _savedWords.add(pair);
          }
        });
      },
    );
  }

  void _PushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWords.map((WordPair pair) {
        return ListTile(
            title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)));
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(title: Text('Saved words')),
          body: ListView(children: divided));
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Word Generator'),
          actions: <Widget>[
            IconButton(onPressed: _PushSaved, icon: Icon(Icons.list))
          ],
        ),
        body: _buildList());
  }
}
