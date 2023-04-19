import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/doctor_model.dart';
import '../../../repository/http_repo.dart';

final postDoctorUseCaseProvider =
    Provider((ref) => PostDoctorUsecase(ref.read(httpRepoProvider)));

class PostDoctorUsecase {
  final HttpRepo _httpRepo;
  PostDoctorUsecase(this._httpRepo);

  Future postDoctor(DoctorModel doctorModel) {
    const uri = '/doctor/';
    return _httpRepo.post(uri, doctorModel);
  }
}
