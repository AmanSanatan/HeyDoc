import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/domain/models/doctor_model.dart';
import 'package:heydocapp/domain/repository/http_repo.dart';

final putDoctorUseCaseprovider =
    Provider((ref) => PutDoctorUsecase(ref.watch(httpRepoProvider)));

class PutDoctorUsecase {
  final HttpRepo _httpRepo;
  PutDoctorUsecase(this._httpRepo);

  Future putDoctor(DoctorModel doctorModel) async {
    String uri = '/doctor${doctorModel.uid}/update';
    final response = await _httpRepo.put(uri, doctorModel);
    return DoctorModel.fromJson(response);
  }
}
