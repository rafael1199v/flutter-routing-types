import 'package:flutter/material.dart';

class MusicSearchPage extends StatefulWidget {
  const MusicSearchPage({super.key});

  @override
  State<MusicSearchPage> createState() => _MusicSearchPageState();
}

class _MusicSearchPageState extends State<MusicSearchPage> {
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

  @override
  void initState() {
    super.initState();
    _filteredMusic = _allMusic;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _filterMusic(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredMusic = _allMusic;
      } else {
        _filteredMusic = _allMusic
            .where((music) => music.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Escoge tu musica")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: _filterMusic,
              decoration: InputDecoration(
                hintText: 'Ej. The Beatles...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMusic.length,
              itemBuilder: (context, index) {
                final musicItem = _filteredMusic[index];
                return ListTile(
                  leading: const Icon(Icons.music_note),
                  title: Text(musicItem),
                  onTap: () {
                    Navigator.pop(context, musicItem);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
