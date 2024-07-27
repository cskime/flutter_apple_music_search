import 'package:flutter/material.dart';

class AlbumToTrackButton extends StatelessWidget {
  const AlbumToTrackButton({
    super.key,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
            offset: const Offset(0, 10),
            child: Icon(
              Icons.queue_music_rounded,
              size: 32,
              color: Colors.grey.shade100,
            ),
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.grey.shade100,
          ),
        ],
      ),
    );
  }
}
