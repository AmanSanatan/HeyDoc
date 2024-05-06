import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repository/http_repo_impl.dart';

String baseUrl =
    'https://7a4a-2401-4900-704a-e909-1571-cf37-1874-b623.ngrok-free.app';
final httpRepoProvider = Provider((ref) => HttpRepoImpl());

abstract class HttpRepo {
  Future post(String uri, dynamic object);
  Future put(String uri, dynamic object);
  Future get(String uri);
  Future delete(String uri);
}
