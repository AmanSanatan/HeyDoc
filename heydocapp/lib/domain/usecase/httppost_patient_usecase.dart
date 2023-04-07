import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/patient_model.dart';
import '../repository/http_repo.dart';

final postPatientUseCaseProvider =
    Provider((ref) => PostPatientUsecase(ref.read(httpRepoProvider)));

class PostPatientUsecase {
  final HttpRepo _httpRepo;
  PostPatientUsecase(this._httpRepo);

  Future postPatient(PatientModel patientModel) {
    const uri = '/patient/';
    return _httpRepo.post(uri, patientModel);
  }
}
