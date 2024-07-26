import 'package:flutter/material.dart';

class AlbumTrackTransitionButton extends StatelessWidget {
  const AlbumTrackTransitionButton({
    super.key,
    required this.onPressed,
    required this.showsTrack,
  });

  final void Function() onPressed;
  final bool showsTrack;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        showsTrack
            ? Icons.keyboard_arrow_down_rounded
            : Icons.keyboard_arrow_up_rounded,
        size: 40,
        color: Colors.grey.shade100,
      ),
    );
  }
}
