import 'package:flutter/material.dart';
import '../viewmodels/music_search_viewmodel.dart';

class MusicSearchPage extends StatefulWidget {
  const MusicSearchPage({super.key});

  @override
  State<MusicSearchPage> createState() => _MusicSearchPageState();
}

class _MusicSearchPageState extends State<MusicSearchPage> {
  late final MusicSearchViewmodel _musicSearchViewmodel;
  
  @override
  void initState() {
    super.initState();
    _musicSearchViewmodel = MusicSearchViewmodel();
  }

  @override
  void dispose() {
    _musicSearchViewmodel.dispose();
    super.dispose();
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
              onChanged: _musicSearchViewmodel.filterMusic,
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
            child: ListenableBuilder(
              listenable: _musicSearchViewmodel,
              builder: (context, _) {
                return ListView.builder(
                  itemCount: _musicSearchViewmodel.filteredMusic.length,
                  itemBuilder: (context, index) {
                    final musicItem = _musicSearchViewmodel.filteredMusic[index];
                    return ListTile(
                      leading: const Icon(Icons.music_note),
                      title: Text(musicItem),
                      onTap: () {
                        Navigator.pop(context, musicItem);
                      },
                    );
                  },
                );
              }
            )
          ),
        ],
      ),
    );
  }
}
