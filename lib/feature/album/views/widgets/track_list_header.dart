import 'package:apple_music_search/feature/album/models/track_model/track_model.dart';
import 'package:flutter/material.dart';

class TrackListHeader extends StatelessWidget {
  const TrackListHeader({
    super.key,
    required this.track,
  });

  final TrackModel track;

  String get description => "${track.trackCount} song(s)";

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
              track.artworkUrl100,
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
                  track.collectionName,
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
                      color: Colors.grey.shade100,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
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
