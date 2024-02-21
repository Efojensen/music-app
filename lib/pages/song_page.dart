import 'package:flutter/material.dart';
import 'package:music_player/providers/playlist_provider.dart';
import 'package:provider/provider.dart';

import '../components/neu_box.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) => Scaffold(
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
                        Image.asset("assets/images/thumb-1920-665374.jpg"),
                        const SizedBox(height: 13),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Song name"),
                                Text("Author name", style: TextStyle(fontSize: 11))
                              ]
                            ),
                            Icon(Icons.favorite, color: Colors.red)
                          ]
                        )
                      ]
                    )
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}