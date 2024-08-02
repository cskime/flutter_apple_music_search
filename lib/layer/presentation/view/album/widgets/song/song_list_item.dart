import 'package:apple_music_search/layer/domain/entity/song/song.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SongListItem extends StatefulWidget {
  const SongListItem({
    super.key,
    required this.song,
    required this.selected,
    required this.playing,
    required this.progress,
    required this.onPlayPressed,
  });

  final Song song;
  final bool selected;
  final bool playing;
  final Stream<double>? progress;
  final void Function(Song song) onPlayPressed;

  @override
  State<SongListItem> createState() => _SongListItemState();
}

class _SongListItemState extends State<SongListItem> {
  AnimationController? _animationController;

  bool _titleOverflows = false;

  bool get _shouldAnimateMarquee => _titleOverflows && widget.selected;

  void _onAnimationInit(AnimationController controller) {
    _animationController = controller;
  }

  void _onAnimationComplete(AnimationController controller) {
    controller.value = 0;
    if (_shouldAnimateMarquee) {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.selected) {
      _animationController?.reset();
    }

    final titleText = "${widget.song.title}      ";
    final titleTextStyle = TextStyle(
      color: Colors.grey.shade100,
      fontSize: 16,
      fontWeight: widget.selected ? FontWeight.bold : FontWeight.w500,
    );
    final titleTextPainter = TextPainter(
      text: TextSpan(text: titleText, style: titleTextStyle),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout();
    final titleWidth = titleTextPainter.size.width;

    return Container(
      color: widget.selected ? Colors.black12 : null,
      child: ListTile(
        titleTextStyle: titleTextStyle,
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.hardEdge,
          child: Image.network(widget.song.albumCoverImageUrl),
        ),
        title: LayoutBuilder(
          builder: (context, constraints) {
            _titleOverflows = constraints.maxWidth < titleWidth;
            final text = titleText + (_titleOverflows ? titleText : "");
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
                    target: _shouldAnimateMarquee ? 1 : 0,
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
        subtitle: Text(
          widget.song.artistName,
          style: TextStyle(
            color: Colors.grey.shade300,
            fontSize: 12,
          ),
        ),
        trailing: SizedBox(
          width: 48,
          height: 48,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: StreamBuilder(
                    stream: widget.progress,
                    builder: (context, snapshot) => CircularProgressIndicator(
                      value: snapshot.data ?? 0,
                      strokeWidth: 3,
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: widget.song.isStreamable ? 1 : 0.5,
                child: IconButton(
                  onPressed: widget.song.isStreamable
                      ? () => widget.onPlayPressed(widget.song)
                      : null,
                  icon: Icon(
                    widget.playing
                        ? Icons.pause_circle_filled_rounded
                        : Icons.play_circle_fill_rounded,
                    color: Colors.grey.shade100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
