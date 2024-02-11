import 'package:flutter/material.dart';
import 'package:music_player/providers/playlist_provider.dart';
import 'package:provider/provider.dart';

import '../components/drawer.dart';
import '../models/song.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("H O M E P A G E"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, object, child){
          final List<Song> playlist = object.playlist;
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index){
              return ListTile(
                leading: Image.asset(playlist[index].thumbnailPath),
                title: Text(playlist[index].songName),
                subtitle: Text(playlist[index].songArtiste),
                onTap: (){}
              );
            }
          );
        }
      )
    );
  }
}