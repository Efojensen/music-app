import 'package:flutter/material.dart';
import 'package:music_player/providers/playlist_provider.dart';
import 'package:provider/provider.dart';
import '../components/neu_box.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  String formatTime(Duration duration) {
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

    return formattedTime;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child){
        final playlist = value.playlist;
        final presentSong = playlist[value.currentIndex ?? 0];

        return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back)
                    ),
                    const Text("P L A Y L I S T"),
                    IconButton(onPressed: (){},
                    icon: const Icon(Icons.menu)
                    )
                  ]
                ),
                NeuBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      children: [
                        Image.asset(presentSong.thumbnailPath),
                        const SizedBox(height: 13),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(presentSong.songName),
                                Text(presentSong.songArtiste, style: const TextStyle(fontSize: 11))
                              ]
                            ),
                            const Icon(Icons.favorite, color: Colors.red)
                          ]
                        )
                      ]
                    )
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(formatTime(value.currentDuration)),
                      const Icon(Icons.shuffle),
                      const Icon(Icons.repeat),
                      Text(formatTime(value.totalDuration))
                    ]
                  ),
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0)
                  ),
                  child: Slider(
                    activeColor: Colors.blue,
                    min: 0,
                    max: value.totalDuration.inSeconds.toDouble(),
                    value: value.currentDuration.inSeconds.toDouble(),
                    onChanged: (double double){

                    }, onChangeEnd: (double double){
                      value.seek(Duration(seconds:double.toInt()));
                    }
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playPreviousSong,
                        child: const NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      )
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: value.pauseOrResume,
                        child: NeuBox(
                          child: Icon(value.isPlaying ? Icons.pause : Icons.play_arrow),
                        ),
                      )
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playNextSong,
                        child: const NeuBox(
                          child: Icon(Icons.skip_next),
                        ),
                      )
                    ),
                  ]
                )
              ],
            ),
          ),
        )
      );
      }
    );
  }
}