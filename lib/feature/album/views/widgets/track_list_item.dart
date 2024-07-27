import 'package:apple_music_search/feature/album/models/track_model/track_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TrackListItem extends StatefulWidget {
  const TrackListItem({
    super.key,
    required this.track,
    required this.playing,
    required this.onPlayPressed,
  });

  final TrackModel track;
  final bool playing;
  final void Function(TrackModel track) onPlayPressed;

  @override
  State<TrackListItem> createState() => _TrackListItemState();
}

class _TrackListItemState extends State<TrackListItem> {
  AnimationController? _animationController;

  void _onAnimationInit(AnimationController controller) {
    _animationController = controller;
  }

  void _onAnimationComplete(AnimationController controller) {
    controller.value = 0;
    if (widget.playing) {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.playing) {
      _animationController?.reset();
    }

    final titleText = "${widget.track.trackNumber}. ${widget.track.trackName} ";
    final titleTextStyle = TextStyle(
      color: Colors.grey.shade100,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );
    final titleTextPainter = TextPainter(
      text: TextSpan(text: titleText, style: titleTextStyle),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    final titleWidth = titleTextPainter.size.width;

    return ListTile(
      titleTextStyle: titleTextStyle,
      leading: Transform.scale(
        scale: 0.8,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.network(widget.track.artworkUrl60),
        ),
      ),
      title: LayoutBuilder(
        builder: (context, constraints) {
          final overflows = constraints.maxWidth < titleWidth;
          final text = titleText + (overflows ? titleText : "");

          return ClipRect(
            clipBehavior: Clip.hardEdge,
            child: Text(
              text,
              style: titleTextStyle,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.visible,
            )
                .animate(
                  autoPlay: false,
                  target: overflows && widget.playing ? 1 : 0,
                  onInit: _onAnimationInit,
                  onComplete: _onAnimationComplete,
                )
                .moveX(
                  begin: 0,
                  end: -titleWidth,
                  duration: 10.seconds,
                ),
          );
        },
      ),
      trailing: IconButton(
        onPressed: () => widget.onPlayPressed(widget.track),
        icon: Icon(
          Icons.play_circle_fill_rounded,
          color: Colors.grey.shade100,
        ),
      ),
    );
  }
}
