import 'package:just_audio/just_audio.dart';

class SampleAudioService {
  AudioPlayer? _audioPlayer;

  Future<Stream<double>> play(String urlString) async {
    if (_audioPlayer == null) {
      _audioPlayer = AudioPlayer();
      await _audioPlayer?.setUrl(urlString);
    }

    _audioPlayer?.setLoopMode(LoopMode.one);
    _audioPlayer?.play();

    return _audioPlayer!.positionStream.map(
      (position) =>
          position.inMilliseconds.toDouble() /
          (_audioPlayer!.duration?.inMilliseconds.toDouble() ?? 1),
    );
  }

  void pause() => _audioPlayer?.pause();

  void stop() {
    _audioPlayer?.stop();
    _audioPlayer?.dispose();
    _audioPlayer = null;
  }

  void dispose() => _audioPlayer?.dispose();
}
