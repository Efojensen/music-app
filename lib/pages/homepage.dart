import 'package:flutter/material.dart';

import '../components/drawer.dart';

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
      drawer: const MyDrawer()
    );
  }
}