import 'package:flutter/material.dart';
import 'package:music_player/providers/playlist_provider.dart';
import 'package:provider/provider.dart';
import '../components/neu_box.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("0:00"),
                      Icon(Icons.shuffle),
                      Icon(Icons.repeat),
                      Text("3:49")
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
                    max: 200,
                    value: 130,
                    onChanged: (value){}
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
                        child: const NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      )
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: (){},
                        child: const NeuBox(
                          child: Icon(Icons.play_arrow),
                        ),
                      )
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){},
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