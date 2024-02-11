import 'package:flutter/material.dart';
import 'package:music_player/pages/settings.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        children: [
          const DrawerHeader(child: Icon(Icons.music_note, size: 100)),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("H O M E"),
            onTap:() => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("S E T T I N G S"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()))
          )
        ]
      )
    );
  }
}