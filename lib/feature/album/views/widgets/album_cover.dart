import 'package:flutter/material.dart';

class AlbumCover extends StatelessWidget {
  const AlbumCover({
    super.key,
    required this.coverUrlString,
    required this.albumName,
    required this.releaseYear,
  });

  final String coverUrlString;
  final String albumName;
  final String releaseYear;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          // height: MediaQuery.sizeOf(context).width * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            coverUrlString,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          releaseYear,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "$albumName\n",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
}
