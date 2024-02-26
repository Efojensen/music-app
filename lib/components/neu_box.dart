import 'package:flutter/material.dart';
import 'package:music_player/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    bool isItDark = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: isItDark? Colors.black : Colors.grey.shade300,
            blurRadius: 12,
            offset: const Offset(4, 4),
          ),
          BoxShadow(
            color: isItDark? Colors.grey.shade800 : Colors.white,
            blurRadius: 12,
            offset: const Offset(-4, -4),
          )
        ]
      ),
      padding: const EdgeInsets.all(12),
      child: child
    );
  }
}