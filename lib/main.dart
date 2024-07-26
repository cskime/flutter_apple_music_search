import 'package:apple_music_search/features/search/views/search_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const AppleMusicSearchApp());
}

class AppleMusicSearchApp extends StatelessWidget {
  const AppleMusicSearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "AppleMusicSearchApp",
      home: SearchScreen(),
    );
  }
}
