import 'package:apple_music_search/feature/album/view_models/tracks_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TracksScreen extends ConsumerStatefulWidget {
  const TracksScreen({
    super.key,
    required this.albumId,
    required this.onShowAlbumPressed,
  });

  final int albumId;
  final void Function() onShowAlbumPressed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TracksScreenState();
}

class _TracksScreenState extends ConsumerState<TracksScreen> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(tracksViewModelProvider(widget.albumId)).when(
          data: (data) => SafeArea(
            bottom: false,
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final track = data[index];
                return ListTile(
                  leading: Transform.scale(
                    scale: 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(track.artworkUrl60),
                    ),
                  ),
                  title: Text(
                    "${track.trackNumber}. ${track.trackName}",
                    style: TextStyle(
                      color: Colors.grey.shade100,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_circle_fill_rounded,
                      color: Colors.grey.shade100,
                    ),
                  ),
                );
              },
            ),
          ),
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
  }
}
