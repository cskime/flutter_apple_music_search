import 'package:apple_music_search/layer/data/network/base/network.dart';
import 'package:apple_music_search/layer/data/network/base/request.dart';
import 'package:apple_music_search/layer/data/network/base/response.dart';

class NetworkMock extends Network {
  Uri? requestUrl;
  String? output;

  @override
  Future<Response> send(Request request) {
    requestUrl = request.url;
    return Future.value(
      Response(output: output, statusCode: 0),
    );
  }
}
