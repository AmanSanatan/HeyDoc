import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/domain/repository/http_repo.dart';

final runModelUseCaseProvider =
    Provider((ref) => RunModelUseCase(ref.read(httpRepoProvider)));

class RunModelUseCase {
  final HttpRepo _httpRepo;
  RunModelUseCase(this._httpRepo);
  Future runModel(
      String spiralFileLink, String waveFileLink, String uid) async {
    final uri = '/predict/$uid';
    Map imageLinkMap = {'url_spiral': spiralFileLink, 'url_wave': waveFileLink};
    var response = await _httpRepo.post(uri, jsonEncode(imageLinkMap));
    return json.decode(response) as int;
  }
}
