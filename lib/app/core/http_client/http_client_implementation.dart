import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'http_client.dart';

part 'http_client_implementation.g.dart';

@Injectable()
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
