import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

class RadioList {
  var _enList = [];
  var _arList = [];
  var _list = [];

  RadioList() {
    readFile();
  }

  void readFile() async {
    String response = await rootBundle.loadString("assets/radio_arabic.json");
    var _radios = await json.decode(response);
    _arList = _radios['radios'];

    response = await rootBundle.loadString("assets/radio_english.json");
    _radios = await json.decode(response);
    _enList = _radios['radios'];

    _list = _arList;
  }

  void switchList(bool flag) {
    if (flag)
      _list = _enList;
    else
      _list = _arList;
  }

  int get length => _list.length;

  String get(int idx, String parameter) => _list[idx][parameter];
}

class RadioPlayer {
  bool isPlaying = false;
  late RadioList _radioList;
  int _currentIdx = 0;
  final _audioPlayer = AudioPlayer();

  RadioPlayer() {
    _radioList = RadioList();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    isPlaying = false;
  }

  Future<void> play() async {
    await _audioPlayer.setUrl(_radioList.get(_currentIdx, 'radio_url'));
    await _audioPlayer.play();
    isPlaying = true;
  }

  void prev() {
    _currentIdx = (_currentIdx - 1) % _radioList.length;
    if (isPlaying) play();
  }

  void forward() {
    _currentIdx = (_currentIdx + 1) % _radioList.length;
    if (isPlaying) play();
  }

  void setFile(bool flag) {
    _radioList.switchList(flag);
  }

  void dispose() async {
    await _audioPlayer.dispose();
  }

  String getCurrentChannel() {
    return _radioList.get(_currentIdx, 'name');
  }
}
