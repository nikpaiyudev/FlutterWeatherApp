import 'package:http/http.dart' as http;

class Http {
  Future<http.Response> get(String url) {
    try {
      return http.get(Uri.parse(url));
    } catch (e) {
      throw Exception(e);
    }
  }
}
