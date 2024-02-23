import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  final List<Song> _playlist = [
    Song(
      songName: "Runnin'",
      thumbnailPath: "assets/images/thumb-1920-82029.jpg",
      songPath: "assets/music/Adam_Lambert_-_Runnin_Naruto_(mp3.pm).mp3",
      songArtiste: "Adam Lambert"
    ),
    Song(
      songName: "AOT Epic Orchestral Cover",
      thumbnailPath: "assets/images/1342979.jpeg",
      songPath: "assets/music/Attack on Titan S4 Ashes on The Fire  EPIC ORCHESTRAL COVER_320kbps.mp3",
      songArtiste: "Ashes on The Fire"
    ),
    Song(
      songName: "Rengoku Theme Epic Music",
      thumbnailPath: "assets/images/1115011.png",
      songPath: "assets/music/Demon Slayer Rengoku Theme  EPIC MUSIC MIX (Set Your Heart Ablaze).mp3",
      songArtiste: "Ufotable"
    ),
    Song(
      songName: "Monster",
      thumbnailPath: "assets/images/thumb-1920-665374.jpg",
      songPath: "assets/music/Skillet - Monster.mp3",
      songArtiste: "Skillet"
    ),
  ];

  int? _currentSongIndex;

  int? get currentIndex => _currentSongIndex;

  List<Song> get playlist => _playlist;

  set currentSongIndex(int? newPosition){
    _currentSongIndex = newPosition;
    notifyListeners();
  }
}