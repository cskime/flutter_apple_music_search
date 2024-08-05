import 'package:apple_music_search/layer/data/network/base/http_method.dart';
import 'package:apple_music_search/layer/data/network/base/request.dart';
import 'package:apple_music_search/layer/data/network/base/response.dart';
import 'package:http/http.dart' as http;

abstract class Network {
  Future<Response> send(Request request);
}

class NetworkImpl extends Network {
  @override
  Future<Response> send(Request request) async {
    final httpResponse = switch (request.method) {
      HttpMethod.get => await http.get(
          request.url,
          headers: request.headers,
        ),
      HttpMethod.post => await http.post(
          request.url,
          headers: request.headers,
        ),
    };

    final response = Response(
      output: httpResponse.body,
      statusCode: httpResponse.statusCode,
    );

    return response;
  }
}
