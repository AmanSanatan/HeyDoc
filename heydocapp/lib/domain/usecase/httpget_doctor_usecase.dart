import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heydocapp/domain/models/doctor_model.dart';
import 'package:heydocapp/domain/repository/http_repo.dart';

final getDoctorUsecaseProvider =
    Provider((ref) => GetDoctorUsecase(ref.watch(httpRepoProvider)));

class GetDoctorUsecase {
  final HttpRepo _httpRepo;
  GetDoctorUsecase(this._httpRepo);

  Future getDoctor(String uid) async {
    String uri = '/doctor/$uid';
    final response = await _httpRepo.get(uri);
    return DoctorModel.fromJson(response);
  }
}
