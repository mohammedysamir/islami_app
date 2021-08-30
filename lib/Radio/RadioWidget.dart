import 'package:flutter/material.dart';
import 'package:islami/Radio/RadioPlayer.dart';

class RadioWidget extends StatefulWidget {
  final _radioPlayer = RadioPlayer();
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<RadioWidget> {

  bool _currentState = false;
  IconData _currentIcon = Icons.play_arrow_rounded;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: prev,
            icon: Icon(
              Icons.skip_previous,
              semanticLabel: 'skip previous',
            ),
          ),
          IconButton(
            onPressed: playOrPause,
            icon: Icon(
              _currentIcon,
              semanticLabel: 'play',
            ),
          ),
          IconButton(
            onPressed: forward,
            icon: Icon(
              Icons.skip_next,
              semanticLabel: 'skip next',
            ),
          ),
        ],
      ),
    );
  }

  void playOrPause() {
    setState(() {
      if (_currentState) {
        _currentState = false;
        _currentIcon = Icons.play_arrow_rounded;
        widget._radioPlayer.pause();
      } else {
        _currentState = true;
        _currentIcon = Icons.pause;
        widget._radioPlayer.play(url: 'http://live.mp3quran.net:9718/');
      }
    });
  }

  void prev() => setState(() => widget._radioPlayer.prev());
  void forward() => setState(() => widget._radioPlayer.forward());
}
