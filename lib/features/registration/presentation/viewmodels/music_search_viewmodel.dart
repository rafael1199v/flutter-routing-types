import 'package:flutter/material.dart';

class MusicSearchViewmodel extends ChangeNotifier {

  final List<String> _allMusic = [
    'The Beatles',
    'Michael Jackson',
    'Queen',
    'Elvis Presley',
    'Madonna',
    'Elton John',
    'Led Zeppelin',
    'Pink Floyd',
    'Nirvana',
    'Metallica',
    'AC/DC',
    'Eminem',
    'Tupac Shakur',
    'Snoop Dogg',
    'Dr. Dre',
    'Beyoncé',
    'Jay-Z',
    'Taylor Swift',
    'Ed Sheeran',
    'Adele',
    'Drake',
    'The Weeknd',
    'Bad Bunny',
    'Shakira',
    'Luis Miguel',
    'Gustavo Cerati',
    'Charly García',
    'Spinetta',
    'Soda Stereo',
    'Los Prisioneros',
    'Daft Punk',
    'Coldplay',
    'Arctic Monkeys',
    'The Strokes',
    'Radiohead',
    'Gorillaz',
    'Red Hot Chili Peppers',
    'Foo Fighters',
    'Muse',
    'The Killers',
  ];

  List<String> _filteredMusic = [];
  List<String> get filteredMusic => _filteredMusic;

  MusicSearchViewmodel() {
    _filteredMusic = _allMusic;
  }

  void filterMusic(String query) {
    if (query.isEmpty) {
      _filteredMusic = _allMusic;
    } else {
      _filteredMusic = _allMusic
          .where((music) => music.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    notifyListeners();
  }
  
}