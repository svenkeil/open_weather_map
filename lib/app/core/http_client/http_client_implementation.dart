import 'package:http/http.dart';

import 'http_client.dart';

class HttpClientImplementation implements HttpClient {
  final Client httpClient;

  HttpClientImplementation(this.httpClient);

  @override
  Future<HttpResponse> get(String url) async {
    final response = await httpClient.get(url);

    return HttpResponse(
      data: response.body,
      statusCode: response.statusCode,
    );
  }
}
