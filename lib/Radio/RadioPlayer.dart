import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';


class RadioList {
  var _list = [];

  RadioList({required path}) {
    readFile(path);
  }

  void readFile(String path) async {
    final String response = await rootBundle.loadString(path);
    _list = await json.decode(response);
  }

  int get length => _list.length;

  String get(int idx) => _list[idx];
}

class RadioPlayer {
  int _currentIdx = -1;
  late RadioList _radioList;
  final _audioPlayer = AudioPlayer();

  bool _isUrlSet = false;

  Future<void> pause() async {
    return await _audioPlayer.pause();
  }

  Future<void> play({required String url}) async {
    if (!_isUrlSet) {
      await _audioPlayer.setUrl(url);
      _isUrlSet = true;
    }
    return _audioPlayer.play();
  }

   Future<void> prev() {
    _currentIdx = (_currentIdx - 1) % _radioList.length;
    return play(url : _radioList.get(_currentIdx));
  }

   Future<void> forward() {
     _currentIdx = (_currentIdx + 1) % _radioList.length;
     return play(url : _radioList.get(_currentIdx));
  }
}
