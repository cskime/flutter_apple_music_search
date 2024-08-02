import 'package:apple_music_search/layer/data/network/itunes_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itunesApiProvider = Provider<ItunesApi>(
  (ref) => ItunesApiImpl(),
);
