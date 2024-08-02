import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../domain/entity/artist/artist.dart';

class SearchResultTag extends StatelessWidget {
  const SearchResultTag({
    super.key,
    required this.artist,
    required this.onPressed,
    required this.selected,
  });

  final Artist artist;
  final void Function(Artist artist) onPressed;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: () => onPressed(artist),
      child: AnimatedContainer(
        duration: 150.ms,
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
          artist.name,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
