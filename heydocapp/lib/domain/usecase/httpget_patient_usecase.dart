import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/patient_model.dart';
import '../repository/http_repo.dart';

final getPatientUseCaseProvider =
    Provider((ref) => GetPatientUsecase(ref.watch(httpRepoProvider)));

class GetPatientUsecase {
  final HttpRepo _httpRepo;
  GetPatientUsecase(this._httpRepo);
  Future getPatient(String uid) async {
    final uri = '/patient/$uid';
    var response = await _httpRepo.get(uri);
    return PatientModel.fromJson(response);
  }
}
