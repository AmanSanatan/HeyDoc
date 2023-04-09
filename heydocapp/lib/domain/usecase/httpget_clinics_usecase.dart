import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/clinic_model.dart';
import '../repository/http_repo.dart';

final getClinicsUseCaseProvider =
    Provider((ref) => GetClinicsUsecase(ref.watch(httpRepoProvider)));

class GetClinicsUsecase {
  final HttpRepo _httpRepo;
  GetClinicsUsecase(this._httpRepo);
  Future getClinics() async {
    const uri = '/clinic/';
    var response = await _httpRepo.get(uri);
    return (jsonDecode(response) as List<dynamic>)
        .map<ClinicModel>((value) => ClinicModel.fromMap(value))
        .toList();
  }
}
