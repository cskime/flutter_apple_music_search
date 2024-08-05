import 'package:apple_music_search/layer/data/network/base/network.dart';
import 'package:apple_music_search/layer/data/network/itunes_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkProvider = Provider<Network>(
  (ref) => NetworkImpl(),
);

final itunesApiProvider = Provider<ItunesApi>(
  (ref) => ItunesApiImpl(network: ref.read(networkProvider)),
);
