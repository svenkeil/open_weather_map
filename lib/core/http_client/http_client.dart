import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

abstract class HttpClient {
  Future<HttpResponse> get(String url);
}

class HttpResponse {
  final dynamic data;
  final int statusCode;

  HttpResponse({@required this.data, @required this.statusCode});
}

class HttpClientImplementation implements HttpClient {
  final _httpClient = http.Client();

  @override
  Future<HttpResponse> get(String url) async {
    final response = await _httpClient.get(url);

    return HttpResponse(
      data: response.body,
      statusCode: response.statusCode,
    );
  }
}
