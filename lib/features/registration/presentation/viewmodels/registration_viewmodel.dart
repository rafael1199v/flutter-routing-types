import 'package:flutter/material.dart';

class RegistrationViewModel extends ChangeNotifier {

  String? _selectedMusic;
  String? get selectedMusic => _selectedMusic;

  void setMusic(String music) {
    _selectedMusic = music;
    notifyListeners();
  }

  bool canRegister(bool isFormValid) {
    return isFormValid && _selectedMusic != null;
  }
}