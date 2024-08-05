import 'package:apple_music_search/layer/data/network/base/http_method.dart';

class Request {
  Request({
    required this.endpoint,
    this.path,
    this.method = HttpMethod.get,
    this.query,
    this.headers,
  });

  final String endpoint;
  final String? path;
  final HttpMethod method;
  final Map<String, dynamic>? query;
  final Map<String, String>? headers;
}

extension RequestToUrl on Request {
  Uri get url => Uri.https(endpoint, _pathString(path), query);

  String _pathString(String? path) {
    if (path == null) {
      return "";
    }

    return path.startsWith("/") ? path : "/$path";
  }
}
