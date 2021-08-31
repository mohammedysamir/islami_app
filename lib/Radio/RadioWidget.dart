import 'package:flutter/material.dart';
import 'package:islami/Radio/RadioPlayer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/AppConfig.dart';
import 'package:provider/provider.dart';

class RadioWidget extends StatefulWidget with WidgetsBindingObserver {
  final RadioPlayer _radioPlayer = RadioPlayer();
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<RadioWidget> {
  bool _currentState = false;
  IconData _currentIcon = Icons.play_arrow_rounded;
  String _currentChannel = "-";
  late AppConfigProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    widget._radioPlayer.setFile(AppConfigProvider.getLanguage() == 'en');
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              _currentChannel,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: prev,
                  icon: Icon(
                    Icons.skip_previous,
                    semanticLabel: 'skip prev',
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
          ),
        ],
      ),
    );
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      widget._radioPlayer.dispose();
    }
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
        widget._radioPlayer.play();
      }
      _currentChannel = widget._radioPlayer.getCurrentChannel();
    });
  }

  void prev() => setState(() {
        widget._radioPlayer.prev();
        _currentChannel = widget._radioPlayer.getCurrentChannel();
      });
  void forward() => setState(() {
        widget._radioPlayer.forward();
        _currentChannel = widget._radioPlayer.getCurrentChannel();
      });
}
