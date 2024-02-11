import 'package:flutter/material.dart';
import 'package:music_player/providers/playlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:music_player/pages/homepage.dart';
import 'package:music_player/providers/theme_provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const MyHomePage()
    );
  }
}