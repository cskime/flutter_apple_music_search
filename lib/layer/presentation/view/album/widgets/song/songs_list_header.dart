import 'package:apple_music_search/layer/domain/entity/album/album.dart';
import 'package:flutter/material.dart';

class SongsListHeader extends StatelessWidget {
  const SongsListHeader({
    super.key,
    required this.album,
  });

  final Album album;

  String get description =>
      "${album.artistName} · ${album.primaryGenreName} · ${album.numberOfSongs} song(s)";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              album.coverImageUrl,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 2),
                Text(
                  album.title,
                  style: TextStyle(
                    color: Colors.grey.shade100,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade300,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
