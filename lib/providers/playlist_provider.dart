import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier{
  final List<Song> _playlist = [
    Song(
      songName: "Runnin'",
      thumbnailPath: "assets/images/thumb-1920-82029.jpg",
      songPath: "music/Adam_Lambert_-_Runnin_Naruto_(mp3.pm).mp3",
      songArtiste: "Adam Lambert"
    ),
    Song(
      songName: "AOT Epic Orchestral Cover",
      thumbnailPath: "assets/images/1342979.jpeg",
      songPath: "music/Attack on Titan S4 Ashes on The Fire  EPIC ORCHESTRAL COVER_320kbps.mp3",
      songArtiste: "Ashes on The Fire"
    ),
    Song(
      songName: "Rengoku Theme Epic Music",
      thumbnailPath: "assets/images/1115011.png",
      songPath: "music/Demon Slayer Rengoku Theme  EPIC MUSIC MIX (Set Your Heart Ablaze).mp3",
      songArtiste: "Ufotable"
    ),
    Song(
      songName: "Monster",
      thumbnailPath: "assets/images/thumb-1920-665374.jpg",
      songPath: "music/Skillet - Monster.mp3",
      songArtiste: "Skillet"
    ),
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();

  //The constructor method for the playlist provider
  PlaylistProvider(){
    listenToDuration();
  }

  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Listen to the duration
  void listenToDuration(){
    // Listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration){
      _totalDuration = newDuration;
      notifyListeners();
    });

    // Listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition){
      _currentDuration = newPosition;
      notifyListeners();
    });

    // Listen for the song completion
    _audioPlayer.onPlayerComplete.listen((event){
      playNextSong();
    });

  }

  int? _currentSongIndex;
  // Check whether a song is playing
  bool _isPlaying = false;

  // Play the song
  void play() async{
    final String path = _playlist[_currentSongIndex!].songPath;
    await _audioPlayer.stop();  //Stops whatever song is currently playing
    await _audioPlayer.play(AssetSource(path)); //Play the new song
    _isPlaying = true;
    notifyListeners();
  }

  void pause() async{
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  void resume() async{
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  void pauseOrResume() async{
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  void seek(Duration position) async{
    await _audioPlayer.seek(position);
  }

  void playNextSong(){
    if(_currentSongIndex != null){
      if (_currentSongIndex! < _playlist.length - 1) {
        // Go to the next song if it's not the last song.
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // If it's the last song, loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

  // Play previous song
  void playPreviousSong() async{
    // if more than 2 seconds have passed, restart the current song.
    if (_currentDuration.inSeconds > 2){

    }else{
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      }else {
        // If it's the first song, loop back to the last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  /*  T H E  G E T T E R S   */
  List<Song> get playlist => _playlist;
  int? get currentIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  set currentSongIndex(int? newPosition){
    _currentSongIndex = newPosition;
    if (newPosition != null){
      play(); //Play the song at the new index
    }
    notifyListeners();
  }
}