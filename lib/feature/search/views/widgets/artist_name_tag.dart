import 'package:apple_music_search/feature/search/models/artist/artist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SearchResultTag extends StatelessWidget {
  const SearchResultTag({
    super.key,
    required this.artist,
    required this.onPressed,
    required this.selected,
  });

  final ArtistModel artist;
  final void Function(ArtistModel artist) onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: () => onPressed(artist),
      child: AnimatedContainer(
        duration: 100.ms,
        decoration: BoxDecoration(
          color: selected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: selected ? primaryColor : Theme.of(context).dividerColor,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        child: Text(
          artist.artistName,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
