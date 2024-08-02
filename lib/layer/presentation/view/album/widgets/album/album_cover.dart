import 'package:flutter/material.dart';

class AlbumCover extends StatelessWidget {
  const AlbumCover({
    super.key,
    required this.coverUrlString,
    required this.albumName,
    required this.releaseYear,
    required this.genre,
  });

  final String coverUrlString;
  final String albumName;
  final String releaseYear;
  final String genre;

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
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(0, 4),
                blurRadius: 10,
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.network(
            coverUrlString,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          "$releaseYear · $genre",
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
