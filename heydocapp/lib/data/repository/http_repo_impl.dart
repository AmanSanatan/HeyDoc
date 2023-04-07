import 'package:http/http.dart' as http;

import '../../domain/repository/http_repo.dart';

class HttpRepoImpl extends HttpRepo {
  @override
  Future delete(String uri) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String uri) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future post(String uri, object) async {
    try {
      var url = Uri.parse(baseUrl + uri);
      var payload;
      try {
        payload = object.toJson();
      } catch (e) {
        payload = object;
      }
      print('maine ye patient post krne bola : $payload');
      http.Response response = await http.post(url, body: payload, headers: {
        'Content-type': 'application/json',
      });
      print('post call for $uri');
      print('post response body : ${response.body}');
      if (response.statusCode == 200) {
        print('post success for $uri');
        return response.body;
      } else {
        print('post galat code : ${response.statusCode}');
      }
    } catch (e) {
      print('post error : $e');
      return 'error';
    }
  }

  @override
  Future put(String uri, object) async {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
