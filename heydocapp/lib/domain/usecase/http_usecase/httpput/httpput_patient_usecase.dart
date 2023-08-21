import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/patient_model.dart';
import '../../../repository/http_repo.dart';

final putPatientUseCaseProvider =
    Provider((ref) => PutPatientUsecase(ref.watch(httpRepoProvider)));

class PutPatientUsecase {
  final HttpRepo _httpRepo;
  PutPatientUsecase(this._httpRepo);

  Future putPatient(PatientModel patientModel) {
    var uri = '/patient/${patientModel.uid}/update';
    return _httpRepo.put(uri, patientModel);
  }
}
