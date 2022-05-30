import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selected;
  bool showBtn = false;

  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }

  void showPlayButton(double scrollOffset){
    if(scrollOffset >= 255.0){
      showBtn = true;
    }
    else{
      showBtn = false;
    }
    notifyListeners();
  }
}