import 'package:flutter/material.dart';
import '../../domain/repository/music_repository.dart';

class MusicSearchViewmodel extends ChangeNotifier {
  final MusicRepository _repository;

  List<String> _filteredMusic = [];
  List<String> _allMusic = [];
  bool isLoading = false;
  List<String> get filteredMusic => _filteredMusic;

  MusicSearchViewmodel({required MusicRepository musicRepository})
    : _repository = musicRepository;

  Future<void> loadMusic() async {
    isLoading = true;
    notifyListeners();

    _allMusic = await _repository.getMusicList();
    _filteredMusic = _allMusic;

    isLoading = false;
    notifyListeners();
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
